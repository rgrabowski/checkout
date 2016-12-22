require 'byebug'
require 'ostruct'
require_relative '../lib/checkout'

RSpec.describe Checkout do

  describe '#total' do
    let(:co) { Checkout.new(pricing_rules) }
    before { items.each { |i| co.scan(i) } }

    context 'basket 1' do
      let(:pricing_rules) { ['BuyOneGetOneFree'] }
      let(:items) { ['FR1', 'AP1', 'FR1', 'CF1'] }

      it 'returns price' do
        expect(co.total).to eq(19.34)
      end
    end

    context 'basket 2' do
      let(:pricing_rules) { ['BuyOneGetOneFree'] }
      let(:items) { ['FR1', 'FR1'] }

      it 'returns price' do
        expect(co.total).to eq(3.11)
      end
    end

    context 'basket 3' do
      let(:pricing_rules) { ['Bulk'] }
      let(:items) { ['AP1', 'AP1', 'FR1', 'AP1'] }

      it 'returns price' do
        expect(co.total).to eq(16.61)
      end
    end

  end
end