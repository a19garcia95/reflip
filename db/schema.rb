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

ActiveRecord::Schema.define(version: 20161201205613) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chat_rooms", force: :cascade do |t|
    t.string   "title"
    t.integer  "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_chat_rooms_on_person_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "person_id"
    t.integer  "chat_room_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["chat_room_id"], name: "index_messages_on_chat_room_id", using: :btree
    t.index ["person_id"], name: "index_messages_on_person_id", using: :btree
  end

  create_table "people", force: :cascade do |t|
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
    t.index ["email"], name: "index_people_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_people_on_reset_password_token", unique: true, using: :btree
  end

  create_table "properties", force: :cascade do |t|
    t.string   "address"
    t.string   "citystatezip"
    t.integer  "sqft"
    t.integer  "baths"
    t.integer  "bedrooms"
    t.integer  "estimate"
    t.integer  "valuechange"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "zillow_id"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "latitude"
    t.string   "longitude"
    t.integer  "user_id"
    t.index ["user_id"], name: "index_properties_on_user_id", using: :btree
  end

  create_table "researches", force: :cascade do |t|
    t.string   "title"
    t.float    "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "username"
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  add_foreign_key "chat_rooms", "people"
  add_foreign_key "messages", "chat_rooms"
  add_foreign_key "messages", "people"
  add_foreign_key "properties", "users"
end
