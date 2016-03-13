class CreateCameras < ActiveRecord::Migration
  def change
    create_table :cameras do |t|
      t.integer :specification_id
      t.string :primary
      t.string :features
      t.string :video
      t.string :secondary
    end
  end
end
