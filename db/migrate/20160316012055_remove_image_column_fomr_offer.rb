class RemoveImageColumnFomrOffer < ActiveRecord::Migration
  def change
    remove_attachment :offers, :image
  end
end
