class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.integer :specification_id
      t.string :dimensions
      t.string :weight
      t.string :build
      t.string :sim
    end
  end
end
