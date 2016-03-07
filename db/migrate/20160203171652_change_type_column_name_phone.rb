class ChangeTypeColumnNamePhone < ActiveRecord::Migration
  def change
    change_table :phones do |t|
      t.rename :type, :phone_type
    end
  end
end
