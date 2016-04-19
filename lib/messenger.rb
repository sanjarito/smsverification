module Messenger
    def send_sms(number,vercode)



    acct_sid = ENV["TWILIO_ACCT_SID"]
    auth_token = ENV["TWILIO_AUTH"]




    @client = Twilio::REST::Client.new acct_sid, auth_token
    # @client = Twilio::REST::TaskRouterClient.new acct_sid, auth_token, workspace_sid



    from = '+18446946384'


    message = @client.account.messages.create(
        :from => from,
        :to => '+1'+number,

        :body =>  ' Welcome, your verification number is =  ' + number + vercode + 'red'
        )
    end
end
