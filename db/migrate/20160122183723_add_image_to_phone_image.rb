class AddImageToPhoneImage < ActiveRecord::Migration
 def up
    add_attachment :phone_images, :image
  end

  def down
    remove_attachment :phone_images, :image
  end
end
