class CreateMiscs < ActiveRecord::Migration
  def change
    create_table :miscs do |t|
      t.integer :specification_id
      t.string :colors
    end
  end
end
