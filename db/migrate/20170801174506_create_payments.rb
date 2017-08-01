class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :item
      t.decimal :purchase_price

      t.timestamps null: false
    end
  end
end
