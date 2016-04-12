module Messenger

  def send_sms(number)
    acct_sid = ENV["TWILIO_ACCT_SID"]
    auth_token = ENV["TWILIO_AUTH"]



    @client = Twilio::REST::Client.new acct_sid, auth_token

    from = '+18446946384'
    
    charset = %w{ 2 3 4 6 7 9 A C D E F G H J K M N P Q R T V W X Y Z}
      (0...size).map{ charset.to_a[rand(charset.size)] }.join


    message = @client.account.messages.create(
        :from => from,
        :to => '+1'+number,
        :body => 'Work Hard. Do Good. Change the World. Ya hice una aplication que hace mensajes, mira metete a: https://lit-badlands-63534.herokuapp.com/apps/texty pon el telefono de mariana y dile que vamos a yoga'
        )
  end

end
