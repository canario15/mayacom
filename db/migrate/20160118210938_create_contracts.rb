class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.string :title
      t.integer :technology_id
      t.text :short_desc
      t.timestamps null: false
    end
  end
end
