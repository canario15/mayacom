class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :type
      t.string :mode
      t.string :title
      t.integer :brand_id
      t.string :model
      t.string :new_price
      t.string :old_price
      t.text :short_desc
      t.text :long_desc
      t.boolean :is_most_view
      t.boolean :is_top_sale
      t.boolean :is_top_new

      t.date :enter_date
      t.timestamps
    end
  end
end