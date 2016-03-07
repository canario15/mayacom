class AddImageToAccessoryImage < ActiveRecord::Migration
 def up
    add_attachment :accessory_images, :image
  end

  def down
    remove_attachment :accessory_images, :image
  end
end
