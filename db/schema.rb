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

ActiveRecord::Schema.define(version: 20141220212847) do

  create_table "loans", force: true do |t|
    t.string   "bank"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rates", force: true do |t|
    t.string   "bank"
    t.decimal  "min_rate"
    t.decimal  "max_rate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "currency"
    t.string   "conditions"
    t.string   "withdrawal"
    t.integer  "account_time_length"
    t.string   "deposit_guarantee"
    t.string   "web_link"
    t.string   "amount_limit"
  end

end
