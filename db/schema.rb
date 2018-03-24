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

ActiveRecord::Schema.define(version: 20180324101704) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "batting_records", force: :cascade do |t|
    t.integer "member_id"
    t.integer "game_record_id"
    t.integer "batting_order"
    t.integer "plate_appearance"
    t.integer "at_bat"
    t.integer "hit"
    t.integer "two_base_hit"
    t.integer "three_base_hit"
    t.integer "home_run"
    t.integer "rbi"
    t.integer "strack_out"
    t.integer "bb_hbp"
    t.integer "sacrifice_bunt"
    t.integer "sacrifice_fly"
    t.integer "stolen_base"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_records", force: :cascade do |t|
    t.integer "year"
    t.date "date"
    t.string "ground"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "team_id"
    t.integer "top_of_first"
    t.integer "top_of_second"
    t.integer "top_of_third"
    t.integer "top_of_fourth"
    t.integer "top_of_fifth"
    t.integer "top_of_sixth"
    t.integer "top_of_seventh"
    t.integer "top_of_eighth"
    t.integer "top_of_ninth"
    t.integer "top_of_tenth"
    t.integer "top_of_eleventh"
    t.integer "top_of_twelfth"
    t.integer "bottom_of_first"
    t.integer "bottom_of_second"
    t.integer "bottom_of_third"
    t.integer "bottom_of_fourth"
    t.integer "bottom_of_fifth"
    t.integer "bottom_of_sixth"
    t.integer "bottom_of_seventh"
    t.integer "bottom_of_eighth"
    t.integer "bottom_of_ninth"
    t.integer "bottom_of_tenth"
    t.integer "bottom_of_eleventh"
    t.integer "bottom_of_twelfth"
  end

  create_table "game_relations", force: :cascade do |t|
    t.integer "team_id"
    t.integer "game_record_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_top"
    t.boolean "win"
    t.boolean "lose"
    t.boolean "draw"
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.string "full_name"
    t.integer "uniform_number"
    t.string "position"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "team_id"
    t.index ["team_id"], name: "index_members_on_team_id"
  end

  create_table "pitching_records", force: :cascade do |t|
    t.integer "member_id"
    t.integer "game_record_id"
    t.integer "win"
    t.integer "lose"
    t.integer "save"
    t.integer "inning"
    t.integer "run"
    t.integer "earned_run"
    t.integer "home_run"
    t.integer "strikeout"
    t.integer "bb_hbp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "position_relations", force: :cascade do |t|
    t.integer "batting_record_id"
    t.integer "position_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "positions", force: :cascade do |t|
    t.string "position_name"
    t.string "position_short_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "team_name"
    t.string "team_short_name"
    t.string "home_ground"
    t.text "overview"
    t.string "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "members", "teams"
end
