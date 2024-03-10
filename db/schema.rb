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

ActiveRecord::Schema[7.0].define(version: 2024_03_10_103951) do
  create_table "pickitems", charset: "utf8mb4", force: :cascade do |t|
    t.integer "no"
    t.string "nouhinbi"
    t.string "tana"
    t.string "zone"
    t.string "rack"
    t.string "dan"
    t.string "koma"
    t.string "shohincd"
    t.string "jan"
    t.string "shohinmei"
    t.integer "mklot"
    t.integer "sejlot"
    t.integer "minorder"
    t.integer "pick01"
    t.integer "pick02"
    t.integer "pick03"
    t.integer "totalpick"
    t.integer "pickgroup"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
