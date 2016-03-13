class CreateNetworks < ActiveRecord::Migration
  def change
    create_table :networks do |t|
      t.integer :specification_id
      t.string :tecno
      t.string :band4g
      t.string :band3g
      t.string :band2g
    end
  end
end
