require 'byebug'
require 'ostruct'
require_relative '../lib/checkout'

RSpec.describe PricingRule::BuyOneGetOneFree do

  describe '#process' do

    subject { PricingRule::BuyOneGetOneFree.new(item).process }

    context 'when bogof for 1 product' do
      let(:item) { {product_code: 'FR1', quantity: 1} }

      it 'returns price' do
        expect(subject).to eq(3.11)
      end
    end

    context 'when bogof for 2 products' do
      let(:item) { {product_code: 'FR1', quantity: 2} }

      it 'returns price' do
        expect(subject).to eq(3.11)
      end
    end

    context 'when bogof for 3 products' do
      let(:item) { {product_code: 'FR1', quantity: 3} }

      it 'returns price' do
        expect(subject).to eq(6.22)
      end
    end

    context 'when bogof for 4 products' do
      let(:item) { {product_code: 'FR1', quantity: 4} }

      it 'returns price' do
        expect(subject).to eq(6.22)
      end
    end

    context 'when bogof for 7 products' do
      let(:item) { {product_code: 'FR1', quantity: 7} }

      it 'returns price' do
        expect(subject).to eq(12.44)
      end
    end

  end
end