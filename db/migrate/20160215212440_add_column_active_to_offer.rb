class AddColumnActiveToOffer < ActiveRecord::Migration
  def change
     add_column :offers, :active, :boolean
  end
end
