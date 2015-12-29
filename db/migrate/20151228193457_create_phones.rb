class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :name
      t.string :brand
      t.string :mode
      t.text :description
      t.string :price
      t.integer :stock
      t.date :enter_date
    end
  end
end
