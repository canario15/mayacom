class CreateComms < ActiveRecord::Migration
  def change
    create_table :comms do |t|
      t.integer :specification_id
      t.string :wlan
      t.string :bluetooth
      t.string :gps
      t.string :nfc
      t.string :radio
      t.string :usb
    end
  end
end
