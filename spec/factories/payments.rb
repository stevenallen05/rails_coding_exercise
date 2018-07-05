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


FactoryGirl.define do
  factory :payment do
    item { FFaker::Product.product_name }
    purchase_price '9.99'
  end
end
