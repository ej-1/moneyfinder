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

ActiveRecord::Schema.define(version: 20150102220417) do

  create_table "admins", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "loans", force: true do |t|
    t.string   "bank"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "fixation_rate_3months"
    t.decimal  "fixation_rate_1year"
    t.decimal  "fixation_rate_2years"
    t.decimal  "fixation_rate_3years"
    t.decimal  "fixation_rate_5years"
    t.decimal  "fixation_rate_7years"
    t.decimal  "fixation_rate_10years"
    t.string   "web_link"
  end

  create_table "mortgageloans", force: true do |t|
    t.string   "bank"
    t.decimal  "fixation_rate_3months"
    t.decimal  "fixation_rate_1years"
    t.decimal  "fixation_rate_2years"
    t.decimal  "fixation_rate_3years"
    t.decimal  "fixation_rate_5years"
    t.decimal  "fixation_rate_7years"
    t.decimal  "fixation_rate_10years"
    t.string   "weblink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publics", force: true do |t|
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

  create_table "savingrates", force: true do |t|
    t.string   "bank"
    t.decimal  "min_rate"
    t.decimal  "max_rate"
    t.string   "country"
    t.string   "currency"
    t.string   "conditions"
    t.string   "withdrawal"
    t.integer  "account_time_length"
    t.string   "deposit_guarantee"
    t.string   "amount_limit"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "weblink"
  end

  create_table "smsloans", force: true do |t|
    t.string   "bank"
    t.integer  "min_loanamoun"
    t.integer  "max_loanamoun"
    t.string   "mobile_friendly_site"
    t.string   "smsloan_payment_note"
    t.integer  "smsloan_min_age"
    t.string   "cost_free_loan"
    t.string   "new_borrower_5K"
    t.string   "new_borrower_10K"
    t.string   "no_uc"
    t.string   "skef_member"
    t.string   "bankid"
    t.string   "open_on_saturdays"
    t.string   "weblink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
