class Apps::TextyController < ApplicationController

  def index
    @phone = Phone.new


  end

  def send_text
    @phone = Phone.create(phone_params)
    @phone.send_sms(@phone.clean_number)

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
    if @phone.update(phone_params)
    else
        render :new
    end
end





  private

  def phone_params
    params.require(:phone).permit(:number,:vercode)
  end

end
