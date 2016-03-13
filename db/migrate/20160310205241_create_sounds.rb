class CreateSounds < ActiveRecord::Migration
  def change
    create_table :sounds do |t|
      t.integer :specification_id
      t.string :alerts_type
      t.string :loudspeaker
      t.string :jack_port
    end
  end
end
