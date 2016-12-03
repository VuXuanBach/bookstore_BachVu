class CreateOrderLines < ActiveRecord::Migration
  def change
    create_table :order_lines do |t|
      t.references :book
      t.belongs_to :order, index: true, foreign_key: true
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
