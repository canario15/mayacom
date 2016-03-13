class CreatePlatforms < ActiveRecord::Migration
  def change
    create_table :platforms do |t|
      t.integer :specification_id
      t.string :os
      t.string :chipset
      t.string :cpu
      t.string :gpu
    end
  end
end
