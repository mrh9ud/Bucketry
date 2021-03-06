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

ActiveRecord::Schema.define(version: 2019_12_06_142740) do

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "category_activities", force: :cascade do |t|
    t.integer "activity_id", null: false
    t.integer "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activity_id"], name: "index_category_activities_on_activity_id"
    t.index ["category_id"], name: "index_category_activities_on_category_id"
  end

  create_table "stories", force: :cascade do |t|
    t.integer "user_experience_id", null: false
    t.string "title"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_experience_id"], name: "index_stories_on_user_experience_id"
  end

  create_table "user_experiences", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "activity_id", null: false
    t.boolean "completed"
    t.datetime "goal_date"
    t.datetime "completion_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activity_id"], name: "index_user_experiences_on_activity_id"
    t.index ["user_id"], name: "index_user_experiences_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "birthdate"
    t.string "gender"
    t.boolean "alive"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
  end

  add_foreign_key "category_activities", "activities"
  add_foreign_key "category_activities", "categories"
  add_foreign_key "stories", "user_experiences"
  add_foreign_key "user_experiences", "activities"
  add_foreign_key "user_experiences", "users"
end
