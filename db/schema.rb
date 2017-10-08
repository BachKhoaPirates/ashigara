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

ActiveRecord::Schema.define(version: 20171007150616) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "shoe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shoe_id"], name: "index_bookmarks_on_shoe_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "content"
    t.integer "durability"
    t.integer "comfortability"
    t.integer "ventilation"
    t.integer "money_worthy"
    t.integer "vote_count"
    t.bigint "shoe_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shoe_id"], name: "index_reviews_on_shoe_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "sexes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shoe_shops", force: :cascade do |t|
    t.bigint "shoe_id"
    t.bigint "shop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shoe_id"], name: "index_shoe_shops_on_shoe_id"
    t.index ["shop_id"], name: "index_shoe_shops_on_shop_id"
  end

  create_table "shoes", force: :cascade do |t|
    t.string "name"
    t.float "durability"
    t.float "comfortability"
    t.float "ventilation"
    t.float "overall"
    t.boolean "water_proof"
    t.float "money_worthy"
    t.date "released_date"
    t.bigint "category_id"
    t.bigint "brand_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_shoes_on_brand_id"
    t.index ["category_id"], name: "index_shoes_on_category_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sizes", force: :cascade do |t|
    t.float "foot_length"
    t.float "foot_width"
    t.bigint "shoe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "size"
    t.index ["shoe_id"], name: "index_sizes_on_shoe_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.date "dob"
    t.bigint "sexes_id"
    t.float "foot_length"
    t.float "foot_width"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["sexes_id"], name: "index_users_on_sexes_id"
  end

  add_foreign_key "bookmarks", "shoes"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "reviews", "shoes"
  add_foreign_key "reviews", "users"
  add_foreign_key "shoe_shops", "shoes"
  add_foreign_key "shoe_shops", "shops"
  add_foreign_key "shoes", "brands"
  add_foreign_key "shoes", "categories"
  add_foreign_key "sizes", "shoes"
  add_foreign_key "users", "sexes", column: "sexes_id"
end
