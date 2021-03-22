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

ActiveRecord::Schema.define(version: 2021_03_07_084438) do

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

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "jtis", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "account_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_jtis_on_account_id"
  end

  create_table "project_memberships", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "role", default: 0, comment: "role"
    t.integer "state", default: 0, comment: "state"
    t.uuid "project_id"
    t.uuid "account_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_project_memberships_on_account_id"
    t.index ["project_id"], name: "index_project_memberships_on_project_id"
  end

  create_table "projects", id: :uuid, default: -> { "gen_random_uuid()" }, comment: "project", force: :cascade do |t|
    t.string "title", comment: "project title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "creator_id"
    t.index ["creator_id"], name: "index_projects_on_creator_id"
  end

  create_table "task_accounts", id: :uuid, default: -> { "gen_random_uuid()" }, comment: "Intermediate table between task and account", force: :cascade do |t|
    t.uuid "task_id"
    t.uuid "account_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_task_accounts_on_account_id"
    t.index ["task_id"], name: "index_task_accounts_on_task_id"
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "jtis", "accounts", on_delete: :cascade
  add_foreign_key "project_memberships", "accounts", on_delete: :cascade
  add_foreign_key "project_memberships", "projects", on_delete: :cascade
  add_foreign_key "projects", "accounts", column: "creator_id", on_delete: :nullify
  add_foreign_key "task_accounts", "accounts", on_delete: :cascade
  add_foreign_key "task_accounts", "tasks", on_delete: :cascade
  add_foreign_key "tasks", "accounts", column: "creator_id", on_delete: :nullify
  add_foreign_key "tasks", "projects", on_delete: :cascade
end
