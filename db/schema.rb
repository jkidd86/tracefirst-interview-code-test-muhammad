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

ActiveRecord::Schema[8.1].define(version: 2026_04_16_182955) do
  create_table "animals", force: :cascade do |t|
    t.date "birth_date"
    t.string "breed"
    t.datetime "created_at", null: false
    t.string "name"
    t.string "species"
    t.string "unique_tag"
    t.datetime "updated_at", null: false
    t.index ["unique_tag"], name: "index_animals_on_unique_tag", unique: true
  end

  create_table "tests", id: :integer, default: nil, force: :cascade do |t|
    t.integer "animal_id"
    t.datetime "created_at", null: false
    t.string "name"
    t.string "result"
    t.datetime "updated_at", null: false
    t.integer "veterinarian_id"
    t.index ["animal_id"], name: "index_tests_on_animal_id"
    t.index ["veterinarian_id"], name: "index_tests_on_veterinarian_id"
  end

  create_table "veterinarians", force: :cascade do |t|
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.string "name"
    t.string "number"
    t.string "status"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "tests", "animals"
  add_foreign_key "tests", "veterinarians"
end
