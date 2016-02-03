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

ActiveRecord::Schema.define(version: 20160201201126) do

  create_table "categories", force: :cascade do |t|
    t.integer  "image_id",   limit: 4
    t.string   "catname",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "categories", ["image_id"], name: "index_categories_on_image_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.boolean  "privacity",              null: false
    t.string   "meme",       limit: 255, null: false
    t.string   "memeid",     limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "images", ["user_id"], name: "index_images_on_user_id", using: :btree

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "image_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "likes", ["image_id"], name: "index_likes_on_image_id", using: :btree
  add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.integer  "image_id",   limit: 4
    t.string   "tagname",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "tags", ["image_id"], name: "index_tags_on_image_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",   limit: 255, null: false
    t.string   "password",   limit: 255, null: false
    t.string   "email",      limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "categories", "images"
  add_foreign_key "images", "users"
  add_foreign_key "likes", "images"
  add_foreign_key "likes", "users"
  add_foreign_key "tags", "images"
end
