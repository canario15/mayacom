class CreateTableAccessoriesImages < ActiveRecord::Migration
  def change
    create_table :table_accessories_images do |t|
      t.integer :accessory_id
      t.integer :image_id
    end
  end
end
