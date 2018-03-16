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

ActiveRecord::Schema.define(version: 20180313102915) do

  create_table "course_subject_tasks", force: :cascade do |t|
    t.integer "course_id"
    t.integer "subject_id"
    t.integer "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_subject_tasks_on_course_id"
    t.index ["subject_id"], name: "index_course_subject_tasks_on_subject_id"
    t.index ["task_id"], name: "index_course_subject_tasks_on_task_id"
  end

  create_table "course_subjects", force: :cascade do |t|
    t.integer "course_id"
    t.integer "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id", "subject_id"], name: "index_course_subjects_on_course_id_and_subject_id", unique: true
    t.index ["course_id"], name: "index_course_subjects_on_course_id"
    t.index ["subject_id"], name: "index_course_subjects_on_subject_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "trash", default: 0
    t.string "status"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_courses_on_name", unique: true
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_subjects_on_name", unique: true
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tasks_on_name", unique: true
  end

  create_table "user_courses", force: :cascade do |t|
    t.integer "user_id"
    t.integer "course_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_user_courses_on_course_id"
    t.index ["user_id", "course_id"], name: "index_user_courses_on_user_id_and_course_id", unique: true
    t.index ["user_id"], name: "index_user_courses_on_user_id"
  end

  create_table "user_subjects", force: :cascade do |t|
    t.integer "user_id"
    t.integer "subject_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_user_subjects_on_subject_id"
    t.index ["user_id", "subject_id"], name: "index_user_subjects_on_user_id_and_subject_id", unique: true
    t.index ["user_id"], name: "index_user_subjects_on_user_id"
  end

  create_table "user_tasks", force: :cascade do |t|
    t.integer "user_id"
    t.integer "task_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_user_tasks_on_task_id"
    t.index ["user_id", "task_id"], name: "index_user_tasks_on_user_id_and_task_id", unique: true
    t.index ["user_id"], name: "index_user_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.integer "role"
    t.string "school"
    t.string "graduation"
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
