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

ActiveRecord::Schema[7.1].define(version: 2024_04_13_222259) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "evaluateds", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.string "email"
    t.date "birth_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "psychologists", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.uuid "users_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_psychologists_on_users_id"
  end

  create_table "questionnaire_sents", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "psychologist_id", null: false
    t.uuid "evaluated_id", null: false
    t.uuid "questionnaire_id", null: false
    t.string "status"
    t.string "link_email"
    t.string "answers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evaluated_id"], name: "index_questionnaire_sents_on_evaluated_id"
    t.index ["psychologist_id"], name: "index_questionnaire_sents_on_psychologist_id"
    t.index ["questionnaire_id"], name: "index_questionnaire_sents_on_questionnaire_id"
  end

  create_table "questionnaires", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.json "questions"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "psychologists", "users", column: "users_id"
  add_foreign_key "questionnaire_sents", "evaluateds"
  add_foreign_key "questionnaire_sents", "psychologists"
  add_foreign_key "questionnaire_sents", "questionnaires"
end
