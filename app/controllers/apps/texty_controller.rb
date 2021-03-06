class Apps::TextyController < ApplicationController



  require 'rest_client'
  require 'json'
  require 'open-uri'

  USERNAME = "Api@hotmail.com" # needed to access the APi
  PASSWORD = "Password" # needed to access the APi
  API_BASE_URL = "https://instantsignup.pixfizz.com/v1/admin/users" # base url of the API
  API_BASE_URL2 = "https://instantsignup.pixfizz.com/v1/users/" # base url of the API

  def index
    # @phone = Phone.new

    @phone = Phone.new


    # uri = "#{API_BASE_URL}.json?pages=10" # specifying json format in the URl
    # rest_resource = RestClient::Resource.new(uri, USERNAME, PASSWORD)
    # users = rest_resource.get
    # @users = JSON.parse(users, :symbolize_names => true) # we will convert the return

            @user = User.new
            if @user.id?
              @user = User.last

              redirect_to "/apps/texty/verify"
            elsif !@user.id?

            @user.id = params[:user_id]
            session[:user] = params[:user_id]
            @phone.user_id = params[:user_id]
            @user.save
            uri2 = "#{API_BASE_URL2}#{@user.id}.json" # specifying json format in the URl
            rest_resource = RestClient::Resource.new(uri2, USERNAME, PASSWORD)
            user = rest_resource.get
            @user = JSON.parse(user, :symbolize_names => true) # we will convert the return

          end

            @phone.number = @user[:custom][:telephone]

            if !Phone.exists?(@phone.vercode)
            @phone.vercode = rand(10000..100000).to_s
            @phone.save
            @phone.send_sms(@phone.number,@phone.vercode)

            redirect_to "/apps/texty/verify"

            else
            redirect_to "https://instantsignup.pixfizz.com/site"

            end

  end

  # def show
  #    @user = User.find(params[:id])
  #    @phone.number = @user[:custom][:telephone]
  #
  #    if !Phone.exists?(@phone.vercode)
  #    @phone.vercode = rand(10000..100000).to_s
  #    @phone.send_sms(@phone.number,@phone.vercode)
  #    @phone.save
  #    redirect_to "/apps/texty/verify"
  #
  #    else
  #    redirect_to "https://instantsignup.pixfizz.com/site"
  #
  #    end
  # end

def update_phone
    @phone = Phone.find_by_user_id(session[:user])
    @user = User.find_by_id(session[:user])
    @phone.vercode = rand(10000..100000).to_s
    @phone.update(:number => params[:phone][:number])
    @phone.update(:vercode => @phone.vercode)
    @phone.save
    @phone.send_sms(@phone.number,@phone.vercode)






          redirect_to '/apps/texty/verify'





end



  def send_text
    @phone = Phone.find_by_user_id(session[:user])
    @user = User.find_by_id(session[:user])
    @phone.send_sms(@phone.number,@phone.vercode)
    @phone.save

    if @phone.save && defined?(@phone.number)


      redirect_to '/apps/texty/verify'


    else
      render 'new'
    end
  end


  def forgot




    @phone = Phone.find_by_user_id(session[:user])



    @phone.save


  end

  def verify

 @phone = Phone.find_by_user_id(session[:user])
    @user = User.find_by_id(session[:user])



  end

  def update

    @phone = Phone.find_by_user_id(session[:user])
       @user = User.find_by_id(session[:user])

      if @phone.vercode === params[:phone][:vercode]
        user_api = RestClient::Resource.new('https://instantsignup.pixfizz.com', :user => USERNAME , :password => PASSWORD)
        result = user_api["/v1/users/#{@user.id}.json"].put({:user =>{"custom" => {"vercode":"#{@phone.vercode}"}}})
        result = user_api["/v1/users/#{@user.id}.json"].put({:user =>{"custom" => {"telephone":"#{@phone.number}"}}})
        r
      else
        flash[:alert]="Ver code is invalid"
      flash[:color]="invalid"
      redirect_to :action => 'verify'
      end
      redirect_to "http://instantsignup.pixfizz.com/site/nextsteps"
  end

  def authcallback
    @phone = Phone.last




  end


end
