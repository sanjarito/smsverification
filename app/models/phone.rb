class Phone < ActiveRecord::Base

  include Messenger

  def clean_number
    number = self.number.scan(/\d+/).join
    number[0] == "1" ? number[0] = '' : number
    number unless number.length != 10
  end

  def randomgenerator
    id =  self.id + "1234"

  end

end
