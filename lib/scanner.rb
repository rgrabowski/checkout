class Scanner
  attr_accessor :items

  def initialize
    @items = []
  end

  def scan(product_code)
    item = items.find { |i| i[:product_code] == product_code }

    if item.nil?
      items << { product_code: product_code, quantity: 1 }
    else
      item[:quantity] += 1
    end
  end
end
