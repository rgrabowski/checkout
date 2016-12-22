require 'byebug'
require 'ostruct'
require_relative '../lib/checkout'

RSpec.describe PricingRule::Bulk do

  describe '#process' do

    subject { PricingRule::Bulk.new(item).process }

    context 'when bulk for 3 products' do
      let(:item) { {product_code: 'AP1', quantity: 3} }

      it 'returns price' do
        expect(subject).to eq(13.5)
      end
    end

  end
end