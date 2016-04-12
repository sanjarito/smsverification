class Phone < ActiveRecord::Base

  before_create :generate_token
  include Messenger

  def generate_token
      self.token = SecureRandom.urlsafe_base64
      generate_token if ModelName.exists?(token: self.token)
  end

  def clean_number
    number = self.number.scan(/\d+/).join
    number[0] == "1" ? number[0] = '' : number
    number unless number.length != 10
  end



end
