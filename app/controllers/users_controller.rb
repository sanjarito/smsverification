class UsersController < ApplicationController

  require 'rest_client'
  require 'json'
  require 'open-uri'

    USERNAME = "Api@hotmail.com" # needed to access the APi
    PASSWORD = "Api2000" # needed to access the APi
    API_BASE_URL = "http://instantsignup.pixfizz.com/v1/admin/users" # base url of the API

    def index
      @phone = Phone.last
      @user = User.new
      uri = "#{API_BASE_URL}.json" # specifying json format in the URl
      uripost = "#{API_BASE_URL}"
      rest_resource = RestClient::Resource.new(uri, USERNAME, PASSWORD)
      rest_resource_put = RestClient::Resource.new(uripost, USERNAME, PASSWORD)
      users = rest_resource.get
      @users = JSON.parse(users, :symbolize_names => true) # we will convert the return
      @user.id = @users[-1][:id]
      if !User.exists?(@user.id)
      @user.save


     else

     end

     user_api = RestClient::Resource.new('https://instantsignup.pixfizz.com', :user => USERNAME , :password => PASSWORD)
    #  result = user_api["/v1/users/17659022.json"].put({:user =>{"first_name":"Floyd"}})
    result = user_api["/v1/users/#{@user.id}.json"].put({:user =>{"custom" => {"telephone":"#{@phone.number}"}}})
    result = user_api["/v1/users/#{@user.id}.json"].put({:user =>{"custom" => {"vercode":"#{@phone.vercode}"}}})

    redirect_to "http://instantsignup.pixfizz.com/site/nextsteps"



end




    private

    def phone_params
      params.require(:id)
    end

end
