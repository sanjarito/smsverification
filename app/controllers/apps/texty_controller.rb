class Apps::TextyController < ApplicationController

  require 'rest_client'
  require 'json'
  require 'open-uri'

  USERNAME = "Api@hotmail.com" # needed to access the APi
  PASSWORD = "Api2000" # needed to access the APi
  API_BASE_URL = "http://instantsignup.pixfizz.com/v1/admin/users" # base url of the API
  API_BASE_URL2 = "http://instantsignup.pixfizz.com/v1/users/" # base url of the API

  def index
    # @phone = Phone.new
    @phone = Phone.new
    @user = User.new
    uri = "#{API_BASE_URL}.json?pages=10" # specifying json format in the URl
    rest_resource = RestClient::Resource.new(uri, USERNAME, PASSWORD)
    users = rest_resource.get
    @users = JSON.parse(users, :symbolize_names => true) # we will convert the return
    @user.id = @users[-1][:id]



    uri2 = "#{API_BASE_URL2}#{@user.id}.json" # specifying json format in the URl
    uripost = "#{API_BASE_URL}"
    rest_resource = RestClient::Resource.new(uri2, USERNAME, PASSWORD)
    user = rest_resource.get
    @user = JSON.parse(user, :symbolize_names => true) # we will convert the return
    @phone.number = @user[:custom][:telephone]
    @phone.vercode = rand(10000..100000).to_s
    @phone.send_sms(@phone.number,@phone.vercode)
    @phone.save


    if @phone.save && defined?(@phone.number)


      redirect_to '/apps/texty/verify'


    else
      render 'new'
    end
  end

  def verify

    @phone = Phone.last


  end

  def update

    @phone = Phone.last

      if @phone.vercode === params[:phone][:vercode]
        redirect_to '/users/'
      else
        flash[:alert]="Ver code is invalid"
      flash[:color]="invalid"
      redirect_to :action => 'verify'
      end
  end

  def authcallback
    @phone = Phone.last




  end





  private

  def phone_params
    params.require(:phone).permit(:number,:vercode)
  end

end
