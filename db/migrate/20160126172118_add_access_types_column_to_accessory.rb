class AddAccessTypesColumnToAccessory < ActiveRecord::Migration
  def change
    add_column :accessories, :access_type_id, :integer
  end
end
