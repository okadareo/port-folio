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

ActiveRecord::Schema.define(version: 2021_02_13_055030) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
  end

  create_table "estates", force: :cascade do |t|
    t.integer "admin_id"
    t.string "background_image_id"
    t.string "name"
    t.text "info"
    t.string "address"
    t.string "floor"
    t.integer "price"
    t.string "floor_image_id"
    t.string "property_image_b_id"
    t.string "property_image_c_id"
    t.string "property_image_d_id"
    t.string "property_image_e_id"
    t.string "property_image_f_id"
    t.string "property_image_g_id"
    t.string "property_image_h_id"
    t.string "property_image_i_id"
    t.string "property_image_j_id"
    t.string "property_image_k_id"
    t.string "property_image_l_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "room_number"
    t.string "property_image_a_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "estate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inquiries", force: :cascade do |t|
    t.string "name"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "researches", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "estate_id"
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
