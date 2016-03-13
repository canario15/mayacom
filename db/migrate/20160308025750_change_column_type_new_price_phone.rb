class ChangeColumnTypeNewPricePhone < ActiveRecord::Migration
  def change
    change_column :phones, :new_price, :integer
  end
end
