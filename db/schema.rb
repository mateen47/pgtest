# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_24_083343) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appusers", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "user_type", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_appusers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_appusers_on_reset_password_token", unique: true
  end

  create_table "bugs", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "deadline"
    t.integer "bug_type"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "project_id"
    t.string "screenshot_file_name"
    t.string "screenshot_content_type"
    t.integer "screenshot_file_size"
    t.datetime "screenshot_updated_at"
  end

  create_table "managers", force: :cascade do |t|
    t.integer "manager_id"
    t.string "user_type"
  end

  create_table "project_bugs", force: :cascade do |t|
    t.integer "project_id"
    t.integer "bug_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "description"
  end

  create_table "user_bugs", force: :cascade do |t|
    t.integer "appuser_id"
    t.integer "bug_id"
  end

  create_table "user_projects", force: :cascade do |t|
    t.integer "appuser_id"
    t.integer "project_id"
  end

end
