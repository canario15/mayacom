class AddAccesoryAndPriceColumnsFromOffer < ActiveRecord::Migration
  def change
    add_column :offers, :accessory_id, :integer
    add_column :offers, :price, :integer
  end
end
