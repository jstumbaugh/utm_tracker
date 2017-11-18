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

ActiveRecord::Schema.define(version: 20171118014418) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "page_views", force: :cascade do |t|
    t.datetime "viewed_at"
    t.string "utm_source"
    t.string "utm_medium"
    t.string "utm_campaign"
    t.string "utm_term"
    t.string "utm_content"
    t.string "ip"
    t.string "city"
    t.string "country_code"
    t.string "country_name"
    t.float "latitude"
    t.float "longitude"
    t.integer "metro_code"
    t.string "region_code"
    t.string "region_name"
    t.string "time_zone"
    t.integer "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
