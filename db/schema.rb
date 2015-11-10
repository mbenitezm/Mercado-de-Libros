ActiveRecord::Schema.define(version: 0) do
  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "fullname"
    t.string   "email"
    t.string   "phone"
    t.string   "password_hash"
    t.boolean  "admin", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  create_table "books", force: :cascade do |t|
    t.string   "name"
    t.string   "image_url"
    t.string   "edition"
    t.string   "editorial"
    t.string   "year"
    t.string   "type"
    t.string   "price"
    t.integer  "user_id"
    t.boolean  "transacting", default: false 
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  create_table "exchanges", force: :cascade do |t|
    t.integer  "book_id"
    t.boolean  "waiting", default: false 
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
    t.integer  "message_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end
end