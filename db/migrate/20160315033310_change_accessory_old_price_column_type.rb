class ChangeAccessoryOldPriceColumnType < ActiveRecord::Migration
  def change
    change_column :accessories, :old_price, 'integer USING CAST(old_price AS integer)'
  end
end
