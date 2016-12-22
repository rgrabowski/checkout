require_relative 'value_calculator'

class TotalCalculator
  attr_accessor :items, :pricing_rules

  def initialize(scanner, pricing_rules)
    @items = scanner.items
    @pricing_rules = pricing_rules
  end

  def total
    items.inject(0) do |memo, item|
      memo + set_value(item)
    end
  end

  private

  def set_value(item)
    ValueCalculator.new(item, pricing_rules).calc
  end
end
