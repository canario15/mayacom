class CreateAccessTypes < ActiveRecord::Migration
  def change
    create_table :access_types do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
