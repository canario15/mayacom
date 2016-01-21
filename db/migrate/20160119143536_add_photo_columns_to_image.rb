class AddPhotoColumnsToImage < ActiveRecord::Migration
  def change
    def up
    add_attachment :images, :photo
  end

  def down
    remove_attachment :images, :photo
  end
  end
end
