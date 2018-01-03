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

ActiveRecord::Schema.define(version: 20180103143905) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movies", force: :cascade do |t|
    t.string "title", null: false
    t.date "release_date", null: false
    t.integer "length", null: false
    t.text "description", null: false
    t.string "types", null: false
    t.string "director", null: false
    t.string "writer", null: false
    t.string "country", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "image"
    t.index ["user_id"], name: "index_movies_on_user_id"
  end

  create_table "opinions", force: :cascade do |t|
    t.string "author"
    t.integer "rate", null: false
    t.text "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "movie_id"
    t.bigint "user_id"
    t.index ["movie_id"], name: "index_opinions_on_movie_id"
    t.index ["user_id"], name: "index_opinions_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "author"
    t.integer "rate", null: false
    t.string "body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "movie_id"
    t.index ["movie_id"], name: "index_reviews_on_movie_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "movies", "users"
  add_foreign_key "opinions", "movies"
  add_foreign_key "opinions", "users"
  add_foreign_key "reviews", "movies"
end
