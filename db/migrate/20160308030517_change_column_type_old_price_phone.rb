class ChangeColumnTypeOldPricePhone < ActiveRecord::Migration
  def change
    change_column :phones, :old_price, :integer
  end
end
