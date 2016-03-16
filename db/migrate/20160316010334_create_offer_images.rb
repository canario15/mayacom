class CreateOfferImages < ActiveRecord::Migration
  def change
    create_table :offer_images do |t|
      t.integer :offer_id
    end
  end
end
