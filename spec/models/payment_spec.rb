# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Payment, type: :model do
  before(:all) do
    count = 1_000
    create_list :payment, count, item: 'foo', purchase_price: 9
    create_list :payment, count, item: 'bar', purchase_price: 11
  end

  it 'calculates the average' do
    expect(Payment.improved_get_average).to eq Payment.get_average
  end

  describe 'performance difference' do
    let(:original_benchmark) { Benchmark.measure { Payment.get_average } }
    let(:improved_benchmark) { Benchmark.measure { Payment.improved_get_average } }

    it 'performs faster by at least 6 orders of magnitude' do
      expect(improved_benchmark.utime).to be <= (original_benchmark.utime / 1_000_000)
    end
  end
end
