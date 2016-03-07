class CreatePhonePlans < ActiveRecord::Migration
  def change
    create_table :phone_plans do |t|
      t.integer :plan_id
      t.integer :phone_id
      t.string  :price
      t.timestamps null: false
    end
  end
end
