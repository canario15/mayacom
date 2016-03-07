class CreateAccessoryImages < ActiveRecord::Migration
  def change
    create_table :accessory_images do |t|
      t.integer :accessory_id
      t.timestamps null: false
    end
  end
end
