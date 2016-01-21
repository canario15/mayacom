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

ActiveRecord::Schema.define(version: 20160119143536) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accessories", force: :cascade do |t|
    t.string   "title"
    t.integer  "brand_id"
    t.string   "new_price"
    t.string   "old_price"
    t.text     "short_desc"
    t.text     "long_desc"
    t.boolean  "is_most_view"
    t.boolean  "is_top_sale"
    t.boolean  "is_top_new"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contracts", force: :cascade do |t|
    t.string   "title"
    t.integer  "technology_id"
    t.text     "short_desc"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "images", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phones", force: :cascade do |t|
    t.string   "type"
    t.string   "mode"
    t.string   "title"
    t.integer  "brand_id"
    t.string   "model"
    t.string   "new_price"
    t.string   "old_price"
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
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "technologies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
