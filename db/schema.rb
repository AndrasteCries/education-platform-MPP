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

ActiveRecord::Schema[7.1].define(version: 2024_04_14_073817) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
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
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "groups", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups_students", id: false, force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "group_id", null: false
    t.boolean "captain"
    t.index ["group_id", "student_id"], name: "index_groups_students_on_group_id_and_student_id"
    t.index ["student_id", "group_id"], name: "index_groups_students_on_student_id_and_group_id"
  end

  create_table "groups_subjects", id: false, force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "subject_id", null: false
    t.index ["group_id", "subject_id"], name: "index_groups_subjects_on_group_id_and_subject_id"
    t.index ["subject_id", "group_id"], name: "index_groups_subjects_on_subject_id_and_group_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.text "title"
    t.integer "subject_id"
    t.text "notes"
    t.date "date"
    t.integer "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lesson_type"
    t.integer "lesson_time"
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

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.string "recipient_type"
    t.integer "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_responses", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "task_id"
    t.bigint "mark_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.binary "attached_file"
    t.index ["mark_id"], name: "index_student_responses_on_mark_id"
    t.index ["student_id"], name: "index_student_responses_on_student_id"
    t.index ["task_id"], name: "index_student_responses_on_task_id"
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
    t.integer "teacher_id"
  end

  create_table "subjects_teachers", id: false, force: :cascade do |t|
    t.bigint "teacher_id", null: false
    t.bigint "subject_id", null: false
    t.index ["subject_id", "teacher_id"], name: "index_subjects_teachers_on_subject_id_and_teacher_id"
    t.index ["teacher_id", "subject_id"], name: "index_subjects_teachers_on_teacher_id_and_subject_id"
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "student_responses", "marks"
  add_foreign_key "student_responses", "students"
  add_foreign_key "student_responses", "tasks"
end
