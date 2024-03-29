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

ActiveRecord::Schema[7.0].define(version: 2024_03_08_135702) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "memberships", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "squad_id", null: false
    t.string "role", default: "member", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["squad_id"], name: "index_memberships_on_squad_id"
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "task_id", null: false
    t.text "message", null: false
    t.boolean "is_read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_notifications_on_task_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "squads", force: :cascade do |t|
    t.string "name"
    t.string "logo"
    t.boolean "deleted", default: false, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "status_colors", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "status_group_id", null: false
    t.string "status_1_color", default: "#ffffff", null: false
    t.string "status_2_color", default: "#ffffff", null: false
    t.string "status_3_color"
    t.string "status_4_color"
    t.string "status_5_color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["status_group_id"], name: "index_status_colors_on_status_group_id"
    t.index ["user_id"], name: "index_status_colors_on_user_id"
  end

  create_table "status_groups", force: :cascade do |t|
    t.string "status1", default: "open", null: false
    t.string "status2", default: "closed", null: false
    t.string "status3"
    t.string "status4"
    t.string "status5"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "task_groups", force: :cascade do |t|
    t.string "name"
    t.string "owner_type", null: false
    t.bigint "owner_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_type", "owner_id"], name: "index_task_groups_on_owner"
  end

  create_table "task_types", force: :cascade do |t|
    t.string "name", null: false
    t.string "owner_type", null: false
    t.bigint "owner_id", null: false
    t.boolean "order_id", default: false
    t.boolean "ticket_id", default: false
    t.boolean "alert_time", default: false
    t.boolean "deadline", default: false
    t.boolean "start_date", default: false
    t.boolean "end_date", default: false
    t.boolean "is_private", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_type", "owner_id"], name: "index_task_types_on_owner"
  end

  create_table "task_views", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "item_type", null: false
    t.bigint "item_id", null: false
    t.datetime "viewed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_type", "item_id"], name: "index_task_views_on_item"
    t.index ["user_id"], name: "index_task_views_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "owner_type", null: false
    t.bigint "owner_id", null: false
    t.bigint "task_group_id"
    t.bigint "task_type_id"
    t.text "note", null: false
    t.bigint "created_by_id", null: false
    t.boolean "is_resolved", default: false, null: false
    t.bigint "resolved_by_id"
    t.boolean "is_binned", default: false, null: false
    t.string "priority", default: "normal", null: false
    t.bigint "assignee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assignee_id"], name: "index_tasks_on_assignee_id"
    t.index ["created_by_id"], name: "index_tasks_on_created_by_id"
    t.index ["owner_type", "owner_id"], name: "index_tasks_on_owner"
    t.index ["resolved_by_id"], name: "index_tasks_on_resolved_by_id"
    t.index ["task_group_id"], name: "index_tasks_on_task_group_id"
    t.index ["task_type_id"], name: "index_tasks_on_task_type_id"
  end

  create_table "updates", force: :cascade do |t|
    t.bigint "task_id", null: false
    t.text "note"
    t.bigint "updated_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_updates_on_task_id"
    t.index ["updated_by_id"], name: "index_updates_on_updated_by_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "photo"
    t.boolean "deleted", default: false, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "uid"
    t.string "provider"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.text "avatar_data"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "memberships", "squads"
  add_foreign_key "memberships", "users"
  add_foreign_key "notifications", "tasks"
  add_foreign_key "notifications", "users"
  add_foreign_key "status_colors", "status_groups"
  add_foreign_key "status_colors", "users"
  add_foreign_key "task_views", "users"
  add_foreign_key "tasks", "task_groups"
  add_foreign_key "tasks", "task_types"
  add_foreign_key "tasks", "users", column: "assignee_id"
  add_foreign_key "tasks", "users", column: "created_by_id"
  add_foreign_key "tasks", "users", column: "resolved_by_id"
  add_foreign_key "updates", "tasks"
  add_foreign_key "updates", "users", column: "updated_by_id"
end
