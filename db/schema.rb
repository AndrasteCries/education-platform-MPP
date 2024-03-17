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

ActiveRecord::Schema[7.1].define(version: 2024_03_17_155346) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.text "title"
    t.integer "subject_id"
    t.text "notes"
    t.date "date"
    t.integer "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "links", force: :cascade do |t|
    t.string "name"
    t.string "image_src"
    t.text "text_content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "marks", force: :cascade do |t|
    t.integer "student_id"
    t.integer "task_id"
    t.date "date"
    t.integer "mark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.text "first_name"
    t.text "middle_name"
    t.text "last_name"
    t.integer "group_id"
    t.text "phone_number"
    t.text "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "students_unique_email", unique: true
    t.index ["reset_password_token"], name: "students_unique_reset_password_token", unique: true
  end

  create_table "subject_teachers", force: :cascade do |t|
    t.integer "subject_id"
    t.integer "teacher_id"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.text "title"
    t.text "description"
    t.integer "hours"
    t.text "difficulty_level"
    t.integer "lessons_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.text "title"
    t.integer "lesson_id"
    t.text "notes"
    t.date "deadline"
    t.text "material"
    t.integer "max_mark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.text "first_name"
    t.text "middle_name"
    t.text "last_name"
    t.text "phone_number"
    t.text "email"
    t.text "degree"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "teachers_unique_email", unique: true
    t.index ["reset_password_token"], name: "teachers_unique_reset_password_token", unique: true
  end

end
