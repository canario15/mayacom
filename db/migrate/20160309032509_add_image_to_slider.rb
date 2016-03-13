class AddImageToSlider < ActiveRecord::Migration
  def up
    add_attachment :sliders, :image
  end

  def down
    remove_attachment :sliders, :image
  end
end
