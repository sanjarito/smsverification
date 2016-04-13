class Apps::TextyController < ApplicationController

  def index
    @phone = Phone.new


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
