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

ActiveRecord::Schema.define(version: 2019_03_22_234214) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "headers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "menu_id"
    t.index ["menu_id"], name: "index_headers_on_menu_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "size1"
    t.string "size2"
    t.string "size3"
    t.boolean "vegan"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "header_id"
    t.bigint "menu_id"
    t.index ["header_id"], name: "index_items_on_header_id"
    t.index ["menu_id"], name: "index_items_on_menu_id"
  end

  create_table "logs", force: :cascade do |t|
    t.string "description"
    t.string "status"
    t.integer "code"
    t.bigint "menu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["menu_id"], name: "index_logs_on_menu_id"
    t.index ["user_id"], name: "index_logs_on_user_id"
  end

  create_table "menus", force: :cascade do |t|
    t.string "name"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.text "notes"
    t.text "disclaimer"
    t.integer "page_views"
    t.index ["user_id"], name: "index_menus_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "company"
    t.text "bio"
    t.string "location"
    t.string "industry"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "headers", "menus"
  add_foreign_key "items", "headers"
  add_foreign_key "items", "menus"
  add_foreign_key "logs", "menus"
  add_foreign_key "logs", "users"
  add_foreign_key "menus", "users"
end
