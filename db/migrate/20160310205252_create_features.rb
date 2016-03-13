class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.integer :specification_id
      t.string :sensors
      t.string :messaging
      t.string :browser
      t.string :java
      t.string :otras
    end
  end
end
