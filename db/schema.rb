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

ActiveRecord::Schema.define(version: 2019_06_04_145508) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.bigint "state_province_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_province_id"], name: "index_cities_on_state_province_id"
  end

  create_table "favourite_routes", force: :cascade do |t|
    t.bigint "route_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["route_id"], name: "index_favourite_routes_on_route_id"
    t.index ["user_id"], name: "index_favourite_routes_on_user_id"
  end

  create_table "joint_user_trips", force: :cascade do |t|
    t.string "status"
    t.bigint "trip_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_joint_user_trips_on_trip_id"
    t.index ["user_id"], name: "index_joint_user_trips_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "imageable_type"
    t.bigint "imageable_id"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["imageable_type", "imageable_id"], name: "index_photos_on_imageable_type_and_imageable_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.text "description"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "route_id"
    t.string "alert"
    t.boolean "fixed", default: false
    t.index ["route_id"], name: "index_reviews_on_route_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "route_trips", force: :cascade do |t|
    t.bigint "route_id"
    t.bigint "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["route_id"], name: "index_route_trips_on_route_id"
    t.index ["trip_id"], name: "index_route_trips_on_trip_id"
  end

  create_table "routes", force: :cascade do |t|
    t.string "name"
    t.float "longitude"
    t.float "latitude"
    t.text "description"
    t.string "type"
    t.string "style"
    t.string "level"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "type_of"
    t.integer "site_id"
    t.index ["user_id"], name: "index_routes_on_user_id"
  end

  create_table "sites", force: :cascade do |t|
    t.bigint "city_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_sites_on_city_id"
  end

  create_table "state_provinces", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips", force: :cascade do |t|
    t.string "weather"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "state"
    t.date "start_date"
    t.date "end_date"
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "route_setter"
    t.string "username"
    t.string "avatar_photo"
    t.string "location"
    t.text "bio"
    t.string "favorite_styles"
    t.string "current_level"
    t.integer "following", default: [], array: true
    t.integer "followed_by", default: [], array: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "favourite_routes", "routes"
  add_foreign_key "favourite_routes", "users"
  add_foreign_key "joint_user_trips", "trips"
  add_foreign_key "joint_user_trips", "users"
  add_foreign_key "reviews", "routes"
  add_foreign_key "reviews", "users"
  add_foreign_key "route_trips", "routes"
  add_foreign_key "route_trips", "trips"
  add_foreign_key "routes", "sites"
  add_foreign_key "routes", "users"
  add_foreign_key "sites", "cities"
  add_foreign_key "trips", "users"
end
