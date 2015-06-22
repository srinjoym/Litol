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

ActiveRecord::Schema.define(version: 20150622324853) do

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

  create_table "organizations", force: :cascade do |t|
    t.string   "organizationName"
    t.string   "address"
    t.string   "licenseKey"
    t.integer  "numLicenses"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

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
