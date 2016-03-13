class CreateMemories < ActiveRecord::Migration
  def change
    create_table :memories do |t|
      t.integer :specification_id
      t.string :internal
      t.string :external
    end
  end
end
