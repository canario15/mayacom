class AddFinishColumnsFromOffer < ActiveRecord::Migration
  def change
    add_column :offers, :finish_date, :datetime
  end
end
