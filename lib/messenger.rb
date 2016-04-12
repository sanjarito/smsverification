module Messenger

  def send_sms(number)

    varx = 12345

    acct_sid = ENV["TWILIO_ACCT_SID"]
    auth_token = ENV["TWILIO_AUTH"]



    @client = Twilio::REST::Client.new acct_sid, auth_token, varx

    from = '+18446946384'



    message = @client.account.messages.create(
        :from => from,
        :to => '+1'+number,
        :body =>  ' Your verification code is =  ' + number + "green"
        )
  end

end
