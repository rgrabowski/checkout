module PricingRule
  class Base
    attr_accessor :product_code, :quantity, :price

    def initialize(item)
      @product_code = item[:product_code]
      @quantity = item[:quantity]

      @price = Product.find(product_code).price
    end
  end
end
