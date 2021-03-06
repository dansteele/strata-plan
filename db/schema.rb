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

ActiveRecord::Schema.define(version: 20150423132320) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airports", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.string   "country"
    t.string   "iata"
    t.string   "icao"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "altitude"
    t.float    "timezone"
    t.string   "dst"
    t.string   "timezonedb"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flight_plans", force: :cascade do |t|
    t.point    "start"
    t.point    "end"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "flight_id"
    t.integer  "start_airport_id"
    t.integer  "end_airport_id"
    t.string   "start_city"
    t.string   "start_country"
    t.string   "end_city"
    t.string   "end_country"
    t.float    "total_distance"
    t.float    "price"
    t.integer  "observation_id"
    t.integer  "bearing"
  end

  create_table "journeys", force: :cascade do |t|
    t.integer  "traveller_id"
    t.string   "name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "type"
    t.integer  "passengers"
  end

  create_table "observations", force: :cascade do |t|
    t.string   "name"
    t.string   "country"
    t.integer  "wind_direction"
    t.integer  "pressure"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "wind_speed"
  end

  create_table "travellers", force: :cascade do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "travellers", ["email"], name: "index_travellers_on_email", unique: true, using: :btree
  add_index "travellers", ["reset_password_token"], name: "index_travellers_on_reset_password_token", unique: true, using: :btree

  create_table "waypoints", force: :cascade do |t|
    t.integer  "journey_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "position"
  end

end
