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

ActiveRecord::Schema.define(version: 20160503021051) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "orders", force: true do |t|
    t.integer  "category"
    t.integer  "shipping_cost"
    t.decimal  "total_cost"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "users_id"
  end

  add_index "orders", ["users_id"], name: "index_orders_on_users_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "picture"
    t.string   "description"
    t.decimal  "price"
    t.integer  "quantity"
    t.integer  "orders_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["orders_id"], name: "index_products_on_orders_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.boolean  "verified"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "firstname"
    t.string   "lastname"
    t.text     "address"
    t.string   "postal_code"
  end

end
