class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :rating, default: 0
      t.string :content

      t.timestamps null: false
    end
  end
end
