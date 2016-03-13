class CreateLaunches < ActiveRecord::Migration
  def change
    create_table :launches do |t|
      t.integer :specification_id
      t.string :announced
      t.string :status
    end
  end
end
