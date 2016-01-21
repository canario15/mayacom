class CreateTableImagesPhones < ActiveRecord::Migration
  def change
    create_table :table_images_phones do |t|
      t.integer :image_id
      t.integer :phone_id
    end
  end
end
