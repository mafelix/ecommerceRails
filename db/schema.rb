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

ActiveRecord::Schema.define(version: 20160620020615) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cart_items", force: true do |t|
    t.integer  "cart_id"
    t.integer  "product_id"
    t.decimal  "unit_price"
    t.integer  "quantity"
    t.integer  "total_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cart_items", ["cart_id"], name: "index_cart_items_on_cart_id", using: :btree
  add_index "cart_items", ["product_id"], name: "index_cart_items_on_product_id", using: :btree

  create_table "carts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "users_id"
  end

  add_index "carts", ["users_id"], name: "index_carts_on_users_id", using: :btree

  create_table "orders", force: true do |t|
    t.integer  "category"
    t.integer  "shipping_cost"
    t.decimal  "total_cost"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "users_id"
    t.integer  "invoice_num"
    t.decimal  "subtotal",      precision: 8, scale: 2
    t.datetime "date_ordered"
  end

  add_index "orders", ["users_id"], name: "index_orders_on_users_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "picture"
    t.string   "description"
    t.decimal  "price",       precision: 8, scale: 2
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category"
    t.boolean  "featured",                            default: false
    t.boolean  "active",                              default: true
  end

  create_table "reviews", force: true do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.text     "content"
    t.integer  "rating_out_of_five"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["product_id"], name: "index_reviews_on_product_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "verified"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "address"
    t.string   "postal_code"
    t.boolean  "admin"
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "image_one"
    t.string   "image_two"
    t.string   "image_three"
    t.string   "image_four"
    t.string   "unconfirmed_email"
    t.string   "province"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
