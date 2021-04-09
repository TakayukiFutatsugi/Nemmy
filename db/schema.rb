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

ActiveRecord::Schema.define(version: 2021_04_09_185342) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "clients", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.text "homepage"
    t.string "industry"
    t.string "business"
    t.string "staff"
    t.string "address"
    t.text "introduction"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_clients_on_email", unique: true
    t.index ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true
  end

  create_table "entries", force: :cascade do |t|
    t.integer "job_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["job_id"], name: "index_entries_on_job_id"
    t.index ["user_id"], name: "index_entries_on_user_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.integer "client_id", null: false
    t.string "title"
    t.integer "status"
    t.string "salary"
    t.string "benefitProgram"
    t.string "holiday"
    t.string "language"
    t.string "framework"
    t.string "characteristics"
    t.string "skillset"
    t.string "selectionProcess"
    t.string "training"
    t.date "startingDate"
    t.integer "workplace"
    t.string "access"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_jobs_on_client_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "room_id", null: false
    t.boolean "is_user"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id"], name: "index_messages_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_rooms_on_client_id"
    t.index ["user_id"], name: "index_rooms_on_user_id"
  end

  create_table "scouts", force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "user_id", null: false
    t.text "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_scouts_on_client_id"
    t.index ["user_id"], name: "index_scouts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "familyName"
    t.string "lastName"
    t.string "familyNameDetail"
    t.string "lastNameDetail"
    t.integer "gender"
    t.date "birthdate"
    t.integer "prefecture"
    t.date "firstEducation"
    t.string "firstEducationDetail"
    t.date "secondEducation"
    t.string "secondEducationDetail"
    t.date "thirdEducation"
    t.string "thirdEducationDetail"
    t.date "firstCareer"
    t.string "firstCareerDetail"
    t.date "secondCareer"
    t.string "secondCareerDetail"
    t.date "thirdCareer"
    t.string "thirdCareerDetail"
    t.string "certification"
    t.string "reason"
    t.string "duration"
    t.string "strongPoint"
    t.string "weakPoint"
    t.string "goal"
    t.text "learningResource"
    t.text "informationResource"
    t.string "language"
    t.string "framework"
    t.text "portfolio"
    t.string "product"
    t.text "introduction"
    t.integer "workplace"
    t.string "salary"
    t.date "startingDate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "entries", "jobs"
  add_foreign_key "entries", "users"
  add_foreign_key "jobs", "clients"
  add_foreign_key "messages", "rooms"
  add_foreign_key "rooms", "clients"
  add_foreign_key "rooms", "users"
  add_foreign_key "scouts", "clients"
  add_foreign_key "scouts", "users"
end
