class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :description
      t.string :author_name
      t.string :publisher_name
      t.date :published_date
      t.decimal :unit_price, precision: 8, scale: 2
      t.integer :total_rating_value, default: 0
      t.integer :total_rating_count, default: 0

      t.timestamps null: false
    end
  end
end
