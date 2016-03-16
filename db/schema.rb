# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160316012055) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "accessories", force: :cascade do |t|
    t.string   "title"
    t.integer  "brand_id"
    t.integer  "new_price"
    t.integer  "old_price"
    t.text     "short_desc"
    t.text     "long_desc"
    t.boolean  "is_most_view"
    t.boolean  "is_top_sale"
    t.boolean  "is_top_new"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "access_type_id"
  end

  create_table "accessories_phones", force: :cascade do |t|
    t.integer "accessory_id"
    t.integer "phone_id"
  end

  create_table "accessory_images", force: :cascade do |t|
    t.integer  "accessory_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "batteries", force: :cascade do |t|
    t.integer "specification_id"
    t.string  "bat_type"
    t.string  "stand_by"
    t.string  "talk_time"
    t.string  "music_play"
  end

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cameras", force: :cascade do |t|
    t.integer "specification_id"
    t.string  "primary"
    t.string  "features"
    t.string  "video"
    t.string  "secondary"
  end

  create_table "comms", force: :cascade do |t|
    t.integer "specification_id"
    t.string  "wlan"
    t.string  "bluetooth"
    t.string  "gps"
    t.string  "nfc"
    t.string  "radio"
    t.string  "usb"
  end

  create_table "contracts", force: :cascade do |t|
    t.string   "title"
    t.integer  "technology_id"
    t.text     "short_desc"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "displays", force: :cascade do |t|
    t.integer "specification_id"
    t.string  "disp_type"
    t.string  "size"
    t.string  "resolution"
    t.string  "multitouch"
    t.string  "protection"
  end

  create_table "features", force: :cascade do |t|
    t.integer "specification_id"
    t.string  "sensors"
    t.string  "messaging"
    t.string  "browser"
    t.string  "java"
    t.string  "otras"
  end

  create_table "launches", force: :cascade do |t|
    t.integer "specification_id"
    t.string  "announced"
    t.string  "status"
  end

  create_table "memories", force: :cascade do |t|
    t.integer "specification_id"
    t.string  "internal"
    t.string  "external"
  end

  create_table "miscs", force: :cascade do |t|
    t.integer "specification_id"
    t.string  "colors"
  end

  create_table "networks", force: :cascade do |t|
    t.integer "specification_id"
    t.string  "tecno"
    t.string  "band4g"
    t.string  "band3g"
    t.string  "band2g"
  end

  create_table "offer_images", force: :cascade do |t|
    t.integer  "offer_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "offers", force: :cascade do |t|
    t.string   "title"
    t.integer  "phone_id"
    t.text     "description"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "active"
    t.integer  "accessory_id"
    t.integer  "price"
    t.datetime "finish_date"
    t.string   "slider_image_file_name"
    t.string   "slider_image_content_type"
    t.integer  "slider_image_file_size"
    t.datetime "slider_image_updated_at"
  end

  create_table "phone_images", force: :cascade do |t|
    t.integer  "phone_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "phone_plans", force: :cascade do |t|
    t.integer  "plan_id"
    t.integer  "phone_id"
    t.string   "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phones", force: :cascade do |t|
    t.string   "phone_type"
    t.string   "mode"
    t.string   "title"
    t.integer  "brand_id"
    t.string   "model"
    t.integer  "new_price"
    t.integer  "old_price"
    t.text     "short_desc"
    t.text     "long_desc"
    t.boolean  "is_most_view"
    t.boolean  "is_top_sale"
    t.boolean  "is_top_new"
    t.date     "enter_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plans", force: :cascade do |t|
    t.string   "title"
    t.string   "item_1"
    t.string   "item_2"
    t.string   "item_3"
    t.string   "price"
    t.text     "description"
    t.integer  "contract_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "order_number"
  end

  create_table "platforms", force: :cascade do |t|
    t.integer "specification_id"
    t.string  "os"
    t.string  "chipset"
    t.string  "cpu"
    t.string  "gpu"
  end

  create_table "sliders", force: :cascade do |t|
    t.integer  "phone_id"
    t.text     "title"
    t.text     "description"
    t.integer  "duration"
    t.boolean  "active"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "sounds", force: :cascade do |t|
    t.integer "specification_id"
    t.string  "alerts_type"
    t.string  "loudspeaker"
    t.string  "jack_port"
  end

  create_table "specifications", force: :cascade do |t|
    t.integer "phone_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.integer "specification_id"
    t.string  "dimensions"
    t.string  "weight"
    t.string  "build"
    t.string  "sim"
  end

  create_table "technologies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
