class UsersController < ApplicationController

  require 'rest_client'
  require 'json'
  require 'open-uri'

    USERNAME = "santiago_casar@pixfizz.com" # needed to access the APi
    PASSWORD = "Detech28!!" # needed to access the APi
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

     RestClient::Resource.new(USERNAME,PASSWORD).put('http://instantsignup.pixfizz.com/v1/users/2760630', {:user => {:custom => {:telephone => "123123"}.to_json}}) do |response, request, result, &block|
       if [301, 302, 307].include? response.code
         redirected_url = response.headers[:location]
       else
         response.return!(request, result, &block)
       end
     end

      # posting = RestClient::Resource.new('https://instantsignup.pixfizz.com/v1/users', :user => USERNAME, :password => PASSWORD)
      # posting.post('/17527289', {:user => {:custom => {:telephone => "123123"}.to_json}})




end


    #   RestClient::Resource.new(USERNAME,PASSWORD).post('http://instantsignup.pixfizz.com/v1/users/2760630', {:user => {:custom => {:telephone => "123123"}.to_json}})  do |response, request, result, &block|
    #   if [301, 302, 307].include? response.code
    #     redirected_url = response.headers[:location]
    #   else
    #     response.return!(request, result, &block)
    #   end
    # end
# rest_resource_put.put "/2760630", {:user => {:custom => {:telephone => "123123"}.to_json}}

 #     RestClient::Request.execute(
 # method: :get,
 # url: 'http://instantsignup.pixfizz.com/v1/admin/users/',
 # user: USERNAME,
 # password: PASSWORD,
 # payload: { 'user[first_name]' => 'Juancho' }
# )


    # def update
    #   @phone = Phone.last
    #   @user = User.last
    #     uri = "#{API_BASE_URL}/users/2760630" # specifying json format in the URl
    #      RestClient.post 'http://instantsignup.pixfizz.com/v1/admin/users/2760630', {:user => {:custom => {:telephone => "123123"}.to_json}}
    #    end
    #

    # def send
    #   @phone = Phone.last
    #   @user = User.last
    #   uri = "#{API_BASE_URL}/users/2760630" # specifying json format in the URl
    #   rest_resource = RestClient::Resource.new(uri, USERNAME, PASSWORD)
    #   rest_resource.post 'http://instantsignup.pixfizz.com/v1/admin/users/2760630', :nested => {:first_name => 'juancho'}.to_json
    #
    # end

    private

    def phone_params
      params.require(:id)
    end

end
