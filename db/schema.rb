# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140901204852) do

  create_table "authentications", force: true do |t|
    t.integer  "user_id",    null: false
    t.string   "provider",   null: false
    t.string   "uid",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "site"
    t.string   "location",            default: "Москва"
    t.text     "description"
    t.integer  "employees"
    t.integer  "vacancies_count"
    t.boolean  "agency"
    t.string   "phone"
  end

  add_index "companies", ["user_id"], name: "index_companies_on_user_id"

  create_table "identities", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id"

  create_table "relationships", force: true do |t|
    t.integer  "student_id"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["company_id"], name: "index_relationships_on_company_id"
  add_index "relationships", ["student_id", "company_id"], name: "index_relationships_on_student_id_and_company_id", unique: true
  add_index "relationships", ["student_id"], name: "index_relationships_on_student_id"

  create_table "responses", force: true do |t|
    t.integer  "vacancy_id"
    t.integer  "student_id"
    t.integer  "status",     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "responses", ["student_id"], name: "index_responses_on_student_id"
  add_index "responses", ["vacancy_id", "student_id"], name: "index_responses_on_vacancy_id_and_student_id", unique: true
  add_index "responses", ["vacancy_id"], name: "index_responses_on_vacancy_id"

  create_table "students", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "surname"
    t.string   "alias"
    t.string   "location",            default: "Москва"
    t.string   "university"
    t.integer  "grade"
    t.integer  "graduation"
    t.integer  "experience",          default: 0
    t.string   "work"
    t.integer  "language",            default: 0
    t.text     "description"
    t.string   "brief_description"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "students", ["user_id"], name: "index_students_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                                       null: false
    t.string   "crypted_password",                            null: false
    t.string   "salt",                                        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.datetime "last_login_at"
    t.datetime "last_logout_at"
    t.datetime "last_activity_at"
    t.string   "last_login_from_ip_address"
    t.integer  "failed_logins_count",             default: 0
    t.datetime "lock_expires_at"
    t.string   "unlock_token"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
    t.integer  "roles_mask"
  end

  add_index "users", ["activation_token"], name: "index_users_on_activation_token"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["last_logout_at", "last_activity_at"], name: "index_users_on_last_logout_at_and_last_activity_at"
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token"

  create_table "vacancies", force: true do |t|
    t.integer  "company_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "brief_description"
    t.integer  "duration"
    t.string   "location",          default: "Москва"
    t.integer  "worktype",          default: 0
    t.integer  "salaryfrom"
    t.integer  "salaryto"
    t.integer  "status",            default: 1
    t.date     "deadline"
    t.boolean  "paid"
    t.integer  "min_grade"
    t.text     "instruction"
  end

  add_index "vacancies", ["company_id"], name: "index_vacancies_on_company_id"

end
