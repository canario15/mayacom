class CreatePhoneImages < ActiveRecord::Migration
  def change
    create_table :phone_images do |t|
      t.integer :phone_id

      t.timestamps null: false
    end
  end
end
