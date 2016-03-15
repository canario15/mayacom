class ChangeAccessoryNewPriceColumnType < ActiveRecord::Migration
  def change
    change_column :accessories, :new_price, 'integer USING CAST(new_price AS integer)'
  end
end
