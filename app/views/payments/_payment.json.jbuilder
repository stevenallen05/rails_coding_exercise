json.extract! payment, :id, :item, :purchase_price, :created_at, :updated_at
json.url payment_url(payment, format: :json)
