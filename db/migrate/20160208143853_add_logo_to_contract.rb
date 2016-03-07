class AddLogoToContract < ActiveRecord::Migration

  def up
    add_attachment :contracts, :logo
  end

  def down
    remove_attachment :contracts, :logo
  end

end
