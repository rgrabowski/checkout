require 'byebug'
require 'ostruct'
require_relative '../lib/checkout'

RSpec.describe ValueCalculator do

  describe '#calc' do
    subject { ValueCalculator.new(item, pricing_rules).calc }

    context 'when more than 2 pricing rules are applicable' do
      let(:item) { {product_code: 'AP1', quantity: 3} }
      let(:pricing_rules) { ['BuyOneGetOneFree', 'Bulk'] }

      it 'raises error' do
        error_message = 'More than one Pricing Rule is applicable: BuyOneGetOneFree, Bulk'
        expect { subject }.to raise_error(error_message)
      end
    end

  end
end

