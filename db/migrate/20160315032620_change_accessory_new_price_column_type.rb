class ChangeAccessoryNewPriceColumnType < ActiveRecord::Migration
  def change
    remove_column :accessories, :new_price, :string
    add_column  :accessories, :new_price, :integer
  end
end
