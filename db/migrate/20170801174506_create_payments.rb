class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :item
      t.decimal :purchase_price, precision: 16, scale: 2

      t.timestamps null: false
    end
    
    add_index :payments, :purchase_price
  end
end
