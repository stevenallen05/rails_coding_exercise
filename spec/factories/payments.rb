# frozen_string_literal: true

FactoryGirl.define do
  factory :payment do
    item { FFaker::Product.product_name }
    purchase_price '9.99'
  end
end
