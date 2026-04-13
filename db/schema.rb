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

ActiveRecord::Schema.define(version: 2022_11_21_141910) do

  create_table "animals", force: :cascade do |t|
    t.string "unique_tag"
    t.string "name"
    t.string "species"
    t.string "breed"
    t.date "birth_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tests", force: :cascade do |t|
    t.string "name"
    t.string "result"
    t.integer "animal_id"
    t.integer "veterinarian_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["animal_id"], name: "index_tests_on_animal_id"
    t.index ["veterinarian_id"], name: "index_tests_on_veterinarian_id"
  end

  create_table "veterinarians", force: :cascade do |t|
    t.string "name"
    t.string "status"
    t.boolean "admin", default: false
    t.string "number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "tests", "animals"
  add_foreign_key "tests", "veterinarians"
end
