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


class Payment < ActiveRecord::Base
  def self.get_average
    total = 0.00
    count = 0
    Payment.all.each do |pmt|
      total += pmt.purchase_price
      count += 1
    end
    total / count
  end

  def self.improved_get_average
    # Implement an improved average
  end
end
