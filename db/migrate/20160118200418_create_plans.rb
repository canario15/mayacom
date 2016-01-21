class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :title
      t.string :item_1
      t.string :item_2
      t.string :item_3
      t.string :price
      t.text :description
      t.integer :contract_id
      t.timestamps null: false
    end
  end
end
