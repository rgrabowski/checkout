require_relative 'base'

module PricingRule
  class BuyOneGetOneFree < Base

    def applicable?
      quantity >= 2
    end

    def process
      if quantity.even?
        (quantity / 2) * price
      else
        ((quantity - 1) / 2) * price + price
      end
    end
  end
end
