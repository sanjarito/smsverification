class Phone < ActiveRecord::Base

  include Messenger


      def clean_number
        number = self.number.scan(/\d+/).join
        number[0] == "1" ? number[0] = '' : number
        number unless number.length != 10
      end

      def python
      pp Coursera.for "python"
      end
  end
