class Product

  def self.find(product_code)
    all.find { |h| h.product_code == product_code }
  end

  def self.all
    [
        OpenStruct.new(
            product_code: 'FR1',
            name: 'Fruit tea',
            price: 3.11
        ),
        OpenStruct.new(
            product_code: 'AP1',
            name: 'Apple',
            price: 5.00
        ),

        OpenStruct.new(
            product_code: 'CF1',
            name: 'Coffee',
            price: 11.23
        )
    ]
  end
end
