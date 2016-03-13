class CreateDisplays < ActiveRecord::Migration
  def change
    create_table :displays do |t|
      t.integer :specification_id
      t.string :disp_type
      t.string :size
      t.string :resolution
      t.string :multitouch
      t.string :protection
    end
  end
end
