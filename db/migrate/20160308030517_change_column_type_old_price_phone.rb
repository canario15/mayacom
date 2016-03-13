class ChangeColumnTypeOldPricePhone < ActiveRecord::Migration
  def change
    change_column :phones, :old_price, 'integer USING CAST(old_price AS integer)'
  end
end
