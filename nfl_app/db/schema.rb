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

ActiveRecord::Schema.define(version: 20160901153007) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "arrest_cron_jobs", force: :cascade do |t|
    t.decimal  "duration",   precision: 5
    t.string   "status"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "crimes", force: :cascade do |t|
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_crimes", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "crime_id"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "arrest_id"
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.integer  "position_id"
    t.integer  "team_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "positions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "initials"
  end

end
