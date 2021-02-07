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

ActiveRecord::Schema.define(version: 2021_02_07_104315) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "accounts", id: :uuid, default: -> { "gen_random_uuid()" }, comment: "account", force: :cascade do |t|
    t.string "username", comment: "username"
    t.string "email", comment: "email"
    t.string "password_digest", comment: "Encrypted password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_accounts_on_email", unique: true
  end

  create_table "projects", id: :uuid, default: -> { "gen_random_uuid()" }, comment: "project", force: :cascade do |t|
    t.string "title", comment: "project title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tasks", id: :uuid, default: -> { "gen_random_uuid()" }, comment: "task", force: :cascade do |t|
    t.string "name", comment: "task name"
    t.integer "state", default: 0, comment: "task state"
    t.boolean "closed", comment: "task closed?"
    t.uuid "creator_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "project_id"
    t.index ["creator_id"], name: "index_tasks_on_creator_id"
    t.index ["project_id"], name: "index_tasks_on_project_id"
  end

  add_foreign_key "tasks", "accounts", column: "creator_id", on_delete: :nullify
  add_foreign_key "tasks", "projects", on_delete: :cascade
end
