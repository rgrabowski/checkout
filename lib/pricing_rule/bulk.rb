require_relative 'base'

module PricingRule
  class Bulk < Base

    def applicable?
      quantity > 2
    end

    def process
      quantity * set_price
    end

    private

    def set_price
      return price if quantity < 2
      price * 0.9
    end

  end
end
