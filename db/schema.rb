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

ActiveRecord::Schema.define(version: 20160913175801) do

  create_table "currencies", force: :cascade do |t|
    t.string   "name"
    t.integer  "currency_symbol_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "currencies", ["currency_symbol_id"], name: "index_currencies_on_currency_symbol_id"

  create_table "currency_symbols", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority"

  create_table "dishes", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "menus_appeared"
    t.integer  "times_appeared"
    t.integer  "first_appeared"
    t.integer  "last_appeared"
    t.decimal  "lowest_price",   precision: 8, scale: 2
    t.decimal  "decimal",        precision: 8, scale: 2
    t.decimal  "highest_price",  precision: 8, scale: 2
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "dishes", ["first_appeared"], name: "index_dishes_on_first_appeared"
  add_index "dishes", ["last_appeared"], name: "index_dishes_on_last_appeared"

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", id: false, force: :cascade do |t|
    t.integer  "id",         limit: 8
    t.string   "path"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "keywords", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "keywords_menus", id: false, force: :cascade do |t|
    t.integer  "keyword_id"
    t.integer  "menu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "keywords_menus", ["keyword_id"], name: "index_keywords_menus_on_keyword_id"
  add_index "keywords_menus", ["menu_id"], name: "index_keywords_menus_on_menu_id"

  create_table "languages", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "location_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.integer  "location_type_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "locations", ["location_type_id"], name: "index_locations_on_location_type_id"

  create_table "menu_items", force: :cascade do |t|
    t.integer  "menu_page_id"
    t.decimal  "price",        precision: 8, scale: 2
    t.decimal  "decimal",      precision: 8, scale: 2
    t.decimal  "high_price",   precision: 8, scale: 2
    t.integer  "dish_id"
    t.float    "xpos"
    t.float    "ypos"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "menu_items", ["dish_id"], name: "index_menu_items_on_dish_id"
  add_index "menu_items", ["menu_page_id"], name: "index_menu_items_on_menu_page_id"

  create_table "menu_pages", force: :cascade do |t|
    t.integer  "menu_id"
    t.integer  "page_number"
    t.integer  "image_id",    limit: 8
    t.integer  "full_height"
    t.integer  "full_width"
    t.string   "uuid"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "menu_pages", ["menu_id"], name: "index_menu_pages_on_menu_id"

  create_table "menus", force: :cascade do |t|
    t.string   "name"
    t.integer  "sponsor_id"
    t.integer  "event_id"
    t.integer  "venue_id"
    t.integer  "place_id"
    t.string   "physical_description"
    t.integer  "occasion_id"
    t.text     "notes"
    t.string   "call_number"
    t.integer  "language_id"
    t.date     "date"
    t.integer  "location_id"
    t.integer  "currency_id"
    t.integer  "status_id"
    t.integer  "page_count"
    t.integer  "dish_count"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "menus", ["currency_id"], name: "index_menus_on_currency_id"
  add_index "menus", ["event_id"], name: "index_menus_on_event_id"
  add_index "menus", ["language_id"], name: "index_menus_on_language_id"
  add_index "menus", ["location_id"], name: "index_menus_on_location_id"
  add_index "menus", ["occasion_id"], name: "index_menus_on_occasion_id"
  add_index "menus", ["place_id"], name: "index_menus_on_place_id"
  add_index "menus", ["sponsor_id"], name: "index_menus_on_sponsor_id"
  add_index "menus", ["status_id"], name: "index_menus_on_status_id"
  add_index "menus", ["venue_id"], name: "index_menus_on_venue_id"

  create_table "occasions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sponsors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "venues", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
