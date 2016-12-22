require 'forwardable'
require_relative 'product'
require_relative 'scanner'
require_relative 'total_calculator'
require_relative 'pricing_rule/buy_one_get_one_free'
require_relative 'pricing_rule/bulk'

class Checkout
  extend Forwardable
  attr_accessor :pricing_rules, :scanner

  def_delegator :@total_calculator, :total
  def_delegator :@scanner, :scan

  def initialize(pricing_rules)
    @scanner = Scanner.new
    @total_calculator = TotalCalculator.new(scanner, pricing_rules)
  end
end
