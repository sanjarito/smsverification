class Apps::TextyController < ApplicationController

  def index
    @phone = Phone.new
  end

  def send_text
    @phone = Phone.new(phone_params)
    @phone.send_sms(@phone.clean_number)
    @phone.save
    redirect_to :back
  end

  private

  def phone_params
    params.require(:phone).permit(:number)
  end

end
