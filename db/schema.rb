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

ActiveRecord::Schema[7.0].define(version: 2022_05_04_172600) do
  create_table "candidate_works", id: false, force: :cascade do |t|
    t.integer "candidate_id"
    t.integer "work_id"
    t.integer "state", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_candidate_works_on_candidate_id"
    t.index ["work_id"], name: "index_candidate_works_on_work_id"
  end

  create_table "candidates", force: :cascade do |t|
    t.string "candidate_name"
    t.string "candidate_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "company_name"
    t.string "contact_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "works", force: :cascade do |t|
    t.string "work_name"
    t.text "work_description"
    t.integer "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
