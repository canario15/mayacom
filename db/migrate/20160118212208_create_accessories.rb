class CreateAccessories < ActiveRecord::Migration
  def change
    create_table :accessories do |t|
      t.string :title
      t.integer :brand_id
      t.string :new_price
      t.string :old_price
      t.text :short_desc
      t.text :long_desc
      t.boolean :is_most_view
      t.boolean :is_top_sale
      t.boolean :is_top_new
      t.timestamps null: false
    end
  end
end
