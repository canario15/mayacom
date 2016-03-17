class ChangeAccessoryOldPriceColumnType < ActiveRecord::Migration
  def change
    remove_column :accessories, :old_price, :string
    add_column  :accessories, :old_price, :integer
  end
end
