module DeathAnd
  class Format
    class << self
      def currency(value, options = {})
         options = { :currency_symbol => "$",
                     :delimiter       => ",",
                     :decimal_symbol  => ".",
                     :currency_before => true }.merge(options)
         dollars, cents = ('%.2f' % value).split('.')
         dollars.gsub!(/(\d)(?=(\d{3})+(?!\d))/, "\\1#{options[:delimiter]}")

         if options[:currency_before]
           options[:currency_symbol] + dollars + options[:decimal_symbol] + cents
         else
           dollars + options[:decimal_symbol] + cents + options[:currency_symbol]
         end
      end
    end
  end
end
