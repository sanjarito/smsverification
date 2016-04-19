class Apps::TextyController < ApplicationController

  def index
    @phone = Phone.new


  end

  def send_text
    @phone = Phone.create(phone_params)
    @phone.send_sms(@phone.clean_number, @phone.vercode)

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
    @vercodechange = @phone.vercode + "123"
      if @vercodechange === params[:phone][:vercode]
        redirect_to ("http://www.scasar.com")
      else
        flash[:alert]="Ver code is invalid"
      flash[:color]="invalid"
      redirect_to :action => 'verify'
      end
  end





  private

  def phone_params
    params.require(:phone).permit(:number,:vercode)
  end

end
