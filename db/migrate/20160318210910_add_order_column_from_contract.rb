class AddOrderColumnFromContract < ActiveRecord::Migration
  def change
    add_column :contracts, :order, :integer
  end
end
