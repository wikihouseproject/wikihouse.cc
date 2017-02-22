# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170222181263) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "about_points", force: :cascade do |t|
    t.integer  "ordinal",     default: 0
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["ordinal"], name: "index_about_points_on_ordinal", using: :btree
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "enquiries", force: :cascade do |t|
    t.jsonb    "data"
    t.string   "ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "kind"
  end

  create_table "push_type_assets", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "file_uid"
    t.string   "file_name"
    t.integer  "file_size"
    t.string   "file_ext"
    t.string   "mime_type"
    t.string   "description"
    t.uuid     "uploader_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "deleted_at"
  end

  create_table "push_type_node_hierarchies", id: false, force: :cascade do |t|
    t.uuid    "ancestor_id",   null: false
    t.uuid    "descendant_id", null: false
    t.integer "generations",   null: false
    t.index ["ancestor_id", "descendant_id", "generations"], name: "node_anc_desc_idx", unique: true, using: :btree
    t.index ["descendant_id"], name: "node_desc_idx", using: :btree
  end

  create_table "push_type_nodes", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "type"
    t.string   "title"
    t.string   "slug"
    t.jsonb    "field_store",  default: {}, null: false
    t.uuid     "parent_id"
    t.integer  "sort_order"
    t.integer  "status"
    t.datetime "published_at"
    t.datetime "published_to"
    t.uuid     "creator_id"
    t.uuid     "updater_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.datetime "deleted_at"
  end

  create_table "push_type_users", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.jsonb    "field_store",            default: {}, null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.index ["email"], name: "index_push_type_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_push_type_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "repos", force: :cascade do |t|
    t.string   "name"
    t.string   "owner"
    t.jsonb    "data"
    t.datetime "scraped_at"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "kind"
    t.text     "img"
    t.string   "sub_kind"
    t.integer  "commits_count", default: 0
    t.integer  "technology_id"
    t.index ["technology_id"], name: "index_repos_on_technology_id", using: :btree
  end

  create_table "technologies", force: :cascade do |t|
    t.string   "name"
    t.integer  "ordinal",    default: 0
    t.string   "icon"
    t.string   "color"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["ordinal"], name: "index_technologies_on_ordinal", using: :btree
  end

  add_foreign_key "repos", "technologies"
end
