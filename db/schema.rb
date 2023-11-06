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

ActiveRecord::Schema[7.0].define(version: 2023_11_05_195721) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "memberships", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_memberships_on_team_id"
    t.index ["user_id", "team_id"], name: "index_memberships_on_user_id_and_team_id", unique: true
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.integer "created_by"
    t.string "name"
    t.integer "team_id"
    t.text "description"
    t.string "status"
    t.date "deadline"
    t.boolean "completed"
    t.datetime "completed_at"
    t.integer "completed_by"
    t.integer "coordinator"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.text "description"
    t.string "type"
    t.timestamptz "start_time"
    t.timestamptz "end_time"
    t.integer "created_by"
    t.integer "completed_by"
    t.boolean "public"
    t.boolean "completed"
    t.integer "worksheet_id"
    t.integer "project_id"
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
    t.index ["updatable_id", "updatable_type"], name: "index_updates_on_updatable_id_and_updatable_type"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "role"
    t.string "avatar"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "timeout_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "provider"
    t.string "uid"
    t.string "oauth_token"
    t.datetime "oauth_expires_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "views", force: :cascade do |t|
    t.string "entity_type"
    t.integer "entity_id"
    t.integer "user_id"
    t.datetime "view_time", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_type", "entity_id"], name: "index_views_on_entity_type_and_entity_id"
  end

  create_table "worksheets", force: :cascade do |t|
    t.integer "created_by"
    t.integer "team_id"
    t.string "title"
    t.text "description"
    t.integer "task_manager"
    t.date "deadline"
    t.boolean "completed"
    t.datetime "completed_at"
    t.integer "completed_by"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "memberships", "teams"
  add_foreign_key "memberships", "users"
  add_foreign_key "projects", "teams"
  add_foreign_key "projects", "users", column: "completed_by"
  add_foreign_key "projects", "users", column: "coordinator"
  add_foreign_key "projects", "users", column: "created_by"
  add_foreign_key "tasks", "projects"
  add_foreign_key "tasks", "users", column: "completed_by"
  add_foreign_key "tasks", "users", column: "created_by"
  add_foreign_key "tasks", "worksheets"
  add_foreign_key "teams", "users", column: "created_by"
  add_foreign_key "teams", "users", column: "team_lead"
  add_foreign_key "updates", "users", column: "updated_by"
  add_foreign_key "views", "users"
  add_foreign_key "worksheets", "projects"
  add_foreign_key "worksheets", "teams"
  add_foreign_key "worksheets", "users", column: "completed_by"
  add_foreign_key "worksheets", "users", column: "created_by"
  add_foreign_key "worksheets", "users", column: "task_manager"
end
