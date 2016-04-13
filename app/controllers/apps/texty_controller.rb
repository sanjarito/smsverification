class Apps::TextyController < ApplicationController

  def index
    @phone = Phone.new


  end

  def send_sms(number)





    acct_sid = ENV["TWILIO_ACCT_SID"]
    auth_token = ENV["TWILIO_AUTH"]



    @client = Twilio::REST::Client.new acct_sid, auth_token

    from = '+18446946384'



    message = @client.account.messages.create(
        :from => from,
        :to => '+1'+number,
        :body =>  ' Your verification code is =  ' + number + "green"
        )
  end

  def send_text
    @phone = Phone.create(phone_params)
    @phone.send_sms(@phone.clean_number)

    if @phone.save

      redirect_to '/welcome'


    else
      render 'new'
    end
  end

  private

  def phone_params
    params.require(:phone).permit(:number)
  end

end
