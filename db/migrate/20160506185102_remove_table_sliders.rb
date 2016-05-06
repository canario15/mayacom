class RemoveTableSliders < ActiveRecord::Migration
  def up
    drop_table :sliders
  end

  def down
    create_table :sliders do |t|
      t.integer :phone_id
      t.text :title
      t.text :description
      t.integer :duration
      t.boolean :active
      t.timestamps null: false
    end
  end
end
