module Messenger

  def send_sms(caca,id)





    acct_sid = ENV["TWILIO_ACCT_SID"]
    auth_token = ENV["TWILIO_AUTH"]



    @client = Twilio::REST::Client.new acct_sid, auth_token

    from = '+18446946384'



    message = @client.account.messages.create(
        :from => from,
        :to => '+1'+number,
        :body =>  ' Your verification code is =  ' + caca + "green"
        )
  end

end
