class CreateTableAccessoriesPhones < ActiveRecord::Migration
  def change
    create_table :accessories_phones do |t|
      t.integer :accessory_id
      t.integer :phone_id
    end
  end
end
