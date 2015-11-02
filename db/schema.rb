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

ActiveRecord::Schema.define(version: 20151029110935) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointment_facts", force: :cascade do |t|
    t.integer "date_dimension_id"
    t.integer "channel_dimension_id"
  end

  add_index "appointment_facts", ["channel_dimension_id"], name: "index_appointment_facts_on_channel_dimension_id", using: :btree
  add_index "appointment_facts", ["date_dimension_id"], name: "index_appointment_facts_on_date_dimension_id", using: :btree

  create_table "channel_dimensions", force: :cascade do |t|
    t.string "name", limit: 255, null: false
  end

  add_index "channel_dimensions", ["name"], name: "index_channel_dimensions_on_name", unique: true, using: :btree

  create_table "date_dimensions", force: :cascade do |t|
    t.string  "date",                           limit: 255, null: false
    t.string  "date_name",                      limit: 255, null: false
    t.integer "day",                                        null: false
    t.integer "month",                                      null: false
    t.integer "year",                                       null: false
    t.integer "day_of_week",                                null: false
    t.integer "day_of_month",                               null: false
    t.integer "day_of_year",                                null: false
    t.integer "calendar_week",                              null: false
    t.integer "calendar_week_day",                          null: false
    t.integer "calendar_week_year",                         null: false
    t.string  "weekday",                        limit: 255, null: false
    t.string  "weekday_abbreviated",            limit: 255, null: false
    t.string  "month_name",                     limit: 255, null: false
    t.string  "month_name_abbreviated",         limit: 255, null: false
    t.string  "weekday_weekend",                limit: 255, null: false
    t.string  "is_last_day_of_month",           limit: 255, null: false
    t.integer "quarter",                                    null: false
    t.string  "quarter_name",                   limit: 255, null: false
    t.string  "year_month",                     limit: 255, null: false
    t.string  "year_quarter",                   limit: 255, null: false
    t.string  "bank_holiday",                   limit: 255
    t.string  "england_and_wales_bank_holiday", limit: 255
    t.string  "scotland_bank_holiday",          limit: 255
    t.string  "northern_ireland_bank_holiday",  limit: 255
  end

  add_index "date_dimensions", ["date"], name: "index_date_dimensions_on_date", unique: true, using: :btree
  add_index "date_dimensions", ["date_name"], name: "index_date_dimensions_on_date_name", unique: true, using: :btree

  add_foreign_key "appointment_facts", "channel_dimensions"
  add_foreign_key "appointment_facts", "date_dimensions"
end
