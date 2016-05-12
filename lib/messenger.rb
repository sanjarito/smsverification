module Messenger
    def send_sms(number,vercode)



    acct_sid = ENV["TWILIO_ACCT_SID"]
    auth_token = ENV["TWILIO_AUTH"]

    numero = number.to_s

    hello = vercode.to_s

    @client = Twilio::REST::Client.new acct_sid, auth_token
    # @client = Twilio::REST::TaskRouterClient.new acct_sid, auth_token, workspace_sid


    @phone = Phone.last


    from = '+18446946384'


    message = @client.account.messages.create(
        :from => from,
        :to => numero,

        :body =>  ' Thanks for verifying your phone number, your code is  ' + hello + "                                                " + "~The Pixfizz team~"
        )

    end
end
