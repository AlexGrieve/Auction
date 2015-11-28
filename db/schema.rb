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

ActiveRecord::Schema.define(version: 20151128201352) do

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "category"
    t.decimal  "starting_price"
    t.decimal  "buy_now_price"
    t.decimal  "current_price"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
    t.integer  "buyer_id"
    t.decimal  "min_price"
    t.boolean  "product_is_sold"
    t.integer  "bids"
    t.boolean  "auction_is_over"
    t.text     "long_description"
    t.string   "avatar"
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "review"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "reviewer_id"
    t.integer  "reviewed_user_id"
    t.integer  "rating"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "products_sold"
    t.integer  "products_bought"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "cash"
    t.decimal  "average_rating"
    t.string   "avatar"
    t.integer  "total_ratings"
  end

end
