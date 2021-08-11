# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_11_145331) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bets", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.bigint "round_id", null: false
    t.integer "betColor", null: false
    t.integer "betAmount_cents", default: 0, null: false
    t.string "betAmount_currency", default: "CLP", null: false
    t.integer "prizeAmount_cents", default: 0, null: false
    t.string "prizeAmount_currency", default: "CLP", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id", "round_id"], name: "index_bets_on_player_id_and_round_id", unique: true
    t.index ["player_id"], name: "index_bets_on_player_id"
    t.index ["round_id"], name: "index_bets_on_round_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name", null: false
    t.string "lastName", null: false
    t.integer "balance_cents", default: 1000000, null: false
    t.string "balance_currency", default: "CLP", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 1, null: false
  end

  create_table "rounds", force: :cascade do |t|
    t.integer "color", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "bets", "players"
  add_foreign_key "bets", "rounds"
end
