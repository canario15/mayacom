class ChangeAccessoryNewPriceColumnType < ActiveRecord::Migration
  def change
    change_column :accessories, :new_price, :integer
  end
end
