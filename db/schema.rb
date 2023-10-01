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

ActiveRecord::Schema[7.0].define(version: 2023_10_01_060759) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "projects", force: :cascade do |t|
    t.integer "created_by"
    t.string "name"
    t.string "description"
    t.string "status"
    t.date "deadline"
    t.boolean "completed"
    t.string "completed_at"
    t.string "datetime"
    t.integer "completed_by"
    t.integer "coordinator"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "created_by"
    t.string "logo"
    t.integer "team_lead"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "updates", force: :cascade do |t|
    t.integer "updated_by"
    t.text "update_note"
    t.string "updatable_type"
    t.integer "updatable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["updatable_id"], name: "index_updates_on_updatable_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "role"
    t.string "avatar"
    t.string "phone_num"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "views", force: :cascade do |t|
    t.string "entity_type"
    t.integer "entity_id"
    t.integer "user_id"
    t.datetime "view_time", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "worksheets", force: :cascade do |t|
    t.integer "created_by"
    t.string "title"
    t.string "description"
    t.integer "task_manager"
    t.date "deadline"
    t.boolean "completed"
    t.datetime "completed_at"
    t.integer "completed_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
