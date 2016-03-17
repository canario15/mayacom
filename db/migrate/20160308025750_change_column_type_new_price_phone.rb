class ChangeColumnTypeNewPricePhone < ActiveRecord::Migration
  def change
    remove_column :phones, :new_price, :string
    add_column  :phones, :new_price, :integer
  end
end
