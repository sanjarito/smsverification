class Apps::TextyController < ApplicationController

  def index
    @phone = Phone.new



  end

  def send_text
    @phone = Phone.create(phone_params)
    @phone.vercode = rand(10000..100000).to_s
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

      if @phone.vercode === params[:phone][:vercode]
        redirect_to '/users/'
      else
        flash[:alert]="Ver code is invalid"
      flash[:color]="invalid"
      redirect_to :action => 'verify'
      end
  end

  def authcallback
    @phone = Phone.last




  end





  private

  def phone_params
    params.require(:phone).permit(:number,:vercode)
  end

end
