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

ActiveRecord::Schema.define(version: 2022_01_13_125133) do

  create_table "addresses", force: :cascade do |t|
    t.integer "customer_id"
    t.string "name"
    t.string "postal_code"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ancestry"
    t.index ["ancestry"], name: "index_categories_on_ancestry"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "customer_id"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "item_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "last_name_kana"
    t.string "first_name_kana"
    t.string "email"
    t.string "password"
    t.string "postal_code"
    t.string "address"
    t.string "telephone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "is_deleted", default: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "item_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "image_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "item_homes", force: :cascade do |t|
    t.integer "category_id"
    t.integer "customer_id"
    t.string "name"
    t.string "image_id"
    t.string "introduction"
    t.string "place_to_put"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer "category_id"
    t.integer "customer_id"
    t.string "name"
    t.string "image_id"
    t.string "introduction"
    t.integer "price"
    t.string "place_to_put"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order_status", default: 0
    t.integer "order_id"
    t.boolean "is_deleted", default: false, null: false
    t.integer "item_home_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "customer_id"
    t.string "postal_code"
    t.string "address"
    t.string "name"
    t.integer "shipping_cost"
    t.integer "total_payment"
    t.integer "payment_method"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "item_id"
  end

end
