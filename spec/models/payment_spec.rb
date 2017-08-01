require 'rails_helper'

RSpec.describe Payment, type: :model do
  before { 
      create_list :payment, 100, item: 'foo', purchase_price: 9.50
      create_list :payment, 100, item: 'bar', purchase_price: 10.50
  }
  
  it "calculates the average faster than the baseline" do
      expect{ Payment.get_average }.to perform_slower_than {
        total = 0.00
        count = 0
        Payment.all.each do |pmt|
            total += pmt.purchase_price
            count += 1
        end
        total/count
      }.at_least(10).times
  end
end
