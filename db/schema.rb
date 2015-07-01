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

ActiveRecord::Schema.define(version: 20150628035955) do

  create_table "active_courses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "course_id"
    t.boolean  "certification_complete"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "answer_choices", force: :cascade do |t|
    t.integer  "quiz_question_id"
    t.string   "answer"
    t.string   "letter"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "chapters", force: :cascade do |t|
    t.text     "name"
    t.text     "overview"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "order"
  end

  add_index "chapters", ["course_id"], name: "index_chapters_on_course_id"

  create_table "courses", force: :cascade do |t|
    t.text     "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "imageSource"
  end

  create_table "courses_organizations", id: false, force: :cascade do |t|
    t.integer "organization_id", null: false
    t.integer "course_id",       null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "organizationName"
    t.string   "address"
    t.string   "licenseKey"
    t.integer  "numLicenses"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "Course_id"
  end

  add_index "organizations", ["Course_id"], name: "index_organizations_on_Course_id"

  create_table "quiz_questions", force: :cascade do |t|
    t.integer  "Quiz_id"
    t.string   "question"
    t.string   "correct_answer"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "quiz_questions", ["Quiz_id"], name: "index_quiz_questions_on_Quiz_id"

  create_table "quiz_results", force: :cascade do |t|
    t.integer  "active_course_id"
    t.integer  "quiz_id"
    t.boolean  "passed"
    t.integer  "score"
    t.integer  "chapter_id"
    t.datetime "time_passed"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "quizzes", force: :cascade do |t|
    t.string   "name"
    t.integer  "Chapter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "quizzes", ["Chapter_id"], name: "index_quizzes_on_Chapter_id"

  create_table "sections", force: :cascade do |t|
    t.text     "name"
    t.text     "content"
    t.text     "contentType"
    t.integer  "chapter_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "order"
  end

  add_index "sections", ["chapter_id"], name: "index_sections_on_chapter_id"

  create_table "user_milestones", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "chapter_id"
    t.boolean  "quiz_passed"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "user_milestones", ["user_id"], name: "index_user_milestones_on_user_id"

  create_table "user_progresses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "chapter_id"
    t.boolean  "quiz_passed"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "user_progresses", ["user_id"], name: "index_user_progresses_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.integer  "clearance"
    t.string   "license"
    t.integer  "organization_id"
  end

  add_index "users", ["organization_id"], name: "index_users_on_organization_id"

end
