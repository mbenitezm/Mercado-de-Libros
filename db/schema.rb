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

ActiveRecord::Schema.define(version: 20151112221309) do

  create_table "books", force: :cascade do |t|
    t.string   "name"
    t.string   "image_url"
    t.string   "edition"
    t.string   "editorial"
    t.string   "year"
    t.string   "author"
    t.string   "for_what"
    t.string   "price"
    t.integer  "user_id"
    t.boolean  "transacting", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  create_table "exchanges", force: :cascade do |t|
    t.integer  "book_id"
    t.boolean  "finished",      default: false
    t.integer  "owner_id"
    t.integer  "interested_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  create_table "messages", force: :cascade do |t|
    t.string   "text"
    t.integer  "user_id"
    t.integer  "exchange_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  create_table "read_marks", force: :cascade do |t|
    t.integer  "readable_id"
    t.string   "readable_type", null: false
    t.integer  "reader_id"
    t.string   "reader_type",   null: false
    t.datetime "timestamp"
  end

  add_index "read_marks", ["reader_id", "reader_type", "readable_type", "readable_id"], name: "read_marks_reader_readable_index"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "fullname"
    t.string   "phone"
    t.string   "password_hash"
    t.boolean  "admin",         default: false
    t.boolean  "blocked",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

end
