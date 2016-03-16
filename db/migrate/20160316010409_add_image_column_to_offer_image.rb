class AddImageColumnToOfferImage < ActiveRecord::Migration
  def up
    add_attachment :offer_images, :image
  end

  def down
    remove_attachment :offer_images, :image
  end
end
