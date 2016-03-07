class AddOrderColumnToPlan < ActiveRecord::Migration
  def change
    add_column :plans, :order_number, :integer
  end
end
