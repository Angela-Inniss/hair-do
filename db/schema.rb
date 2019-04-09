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

ActiveRecord::Schema.define(version: 2019_04_09_100655) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.bigint "hairstyle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hairstyle_id"], name: "index_comments_on_hairstyle_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "hairdressers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "description"
    t.string "location"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_url"
    t.string "photo"
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_hairdressers_on_user_id"
  end

  create_table "hairstyles", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "category"
    t.string "photo_url"
    t.string "video_url"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["user_id"], name: "index_hairstyles_on_user_id"
  end

  create_table "saved_hairstyles", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "hairstyle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hairstyle_id"], name: "index_saved_hairstyles_on_hairstyle_id"
    t.index ["user_id"], name: "index_saved_hairstyles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "hairstyles"
  add_foreign_key "comments", "users"
  add_foreign_key "hairdressers", "users"
  add_foreign_key "hairstyles", "users"
  add_foreign_key "saved_hairstyles", "hairstyles"
  add_foreign_key "saved_hairstyles", "users"
end
