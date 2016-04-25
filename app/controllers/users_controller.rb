class UsersController < ApplicationController

  require 'rest_client'

    USERNAME = "santiago_casar@pixfizz.com" # needed to access the APi
    PASSWORD = "Detech28!!" # needed to access the APi
    API_BASE_URL = "http://instantsignup.pixfizz.com/v1/admin" # base url of the API

    def index
      @phone = Phone.last
      @user = User.new
      uri = "#{API_BASE_URL}/users.json" # specifying json format in the URl
      rest_resource = RestClient::Resource.new(uri, USERNAME, PASSWORD) # create new rest-client resource to call methods on it
      users = rest_resource.get # will get back you all the detail in json format, but it will we wraped as string, so we will parse it in the next step.
      @users = JSON.parse(users, :symbolize_names => true) # we will convert the return
      @user.id = @users[-1][:id]
      rest_resource.post 'http://instantsignup.pixfizz.com/v1/admin/users/2760630', :nested => {:first_name => 'juancho'}
      if !User.exists?(@user.id)
      @user.save
      

     else

     end




    end

    def show
      # @phone = Phone.last
      # @user = User.last
      # uri = "#{API_BASE_URL}/users/2760630" # specifying json format in the URl
      # rest_resource = RestClient::Resource.new(uri, USERNAME, PASSWORD)
      # rest_resource.put 'http://instantsignup.pixfizz.com/v1/admin/users/2760630', :user[first_name] => 'bob marley', :user[last_name] => 'la llorona')


    end

    # private
    #
    # def phone_params
    #   params.require(:id)
    # end

end
