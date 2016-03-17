class ChangeAccessoryOldPriceColumnType < ActiveRecord::Migration
  def change
    change_column :accessories, :old_price, :integer
  end
end
