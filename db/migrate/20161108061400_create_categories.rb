class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string  :name
      t.integer :sort_order, default: 0

      t.timestamps null: false
    end

    add_index :categories, :name
  end
end
