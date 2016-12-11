class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :shipping_address
      t.integer :total_amount, default: 0

      t.timestamps null: false
    end
  end
end
