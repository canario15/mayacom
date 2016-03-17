class ChangeColumnTypeOldPricePhone < ActiveRecord::Migration
  def change
    remove_column :phones, :old_price, :string
    add_column  :phones, :old_price, :integer
  end
end
