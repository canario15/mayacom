class CreateBatteries < ActiveRecord::Migration
  def change
    create_table :batteries do |t|
      t.integer :specification_id
      t.string :bat_type
      t.string :stand_by
      t.string :talk_time
      t.string :music_play
    end
  end
end
