class ValueCalculator
  attr_accessor :item, :pricing_rules

  def initialize(item, pricing_rules)
    @item = item
    @pricing_rules = pricing_rules
  end

  def calc
    return apply_first_rule if applicable_rules.size < 2
    raise "More than one Pricing Rule is applicable: #{applicable_rules.join(', ')}"
  end

  private

  def applicable_rules
    pricing_rules.map do |rule|
      klass = pricing_rule_klass(rule)
      klass.to_s.split('::').last if klass.new(item).applicable?
    end.flatten
  end

  def apply_first_rule
    rule = pricing_rules.first
    klass = pricing_rule_klass(rule)

    klass.new(item).process
  end

  def pricing_rule_klass(rule)
    Object.const_get("PricingRule::#{rule}")
  end

end
