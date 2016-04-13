class Phone < ActiveRecord::Base


  include Messenger

   id = nil
   after_save {id = self.id}

  def clean_number
    number = self.number.scan(/\d+/).join
    number[0] == "1" ? number[0] = '' : number
    number unless number.length != 10

    
  end



end
