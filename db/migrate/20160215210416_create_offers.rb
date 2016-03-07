class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :title
      t.integer :phone_id
      t.text :description
      t.timestamps null: false
    end
  end
end
