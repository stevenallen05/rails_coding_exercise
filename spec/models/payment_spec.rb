# frozen_string_literal: true

# == Schema Information
#
# Table name: payments
#
#  id             :bigint(8)        not null, primary key
#  item           :string(255)
#  purchase_price :decimal(16, 2)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#


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
