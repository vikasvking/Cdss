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

ActiveRecord::Schema[8.1].define(version: 2026_08_23_083437) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "hemms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "location"
    t.string "make"
    t.string "model"
    t.string "slno"
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "hemm_id", null: false
    t.string "message"
    t.bigint "notifiable_id", null: false
    t.string "notifiable_type", null: false
    t.datetime "read_at"
    t.datetime "updated_at", null: false
    t.index ["hemm_id"], name: "index_notifications_on_hemm_id"
    t.index ["notifiable_type", "notifiable_id"], name: "index_notifications_on_notifiable"
  end

  create_table "tyres", force: :cascade do |t|
    t.boolean "active"
    t.datetime "created_at", null: false
    t.bigint "hemm_id", null: false
    t.string "position"
    t.decimal "pressure"
    t.string "sensor_id"
    t.integer "temp"
    t.datetime "updated_at", null: false
    t.index ["hemm_id"], name: "index_tyres_on_hemm_id"
  end

  add_foreign_key "notifications", "hemms"
  add_foreign_key "tyres", "hemms"
end
