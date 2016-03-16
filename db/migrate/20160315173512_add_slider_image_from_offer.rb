class AddSliderImageFromOffer < ActiveRecord::Migration
  def up
    add_attachment :offers, :slider_image
  end

  def down
    remove_attachment :offers, :slider_image
  end
end
