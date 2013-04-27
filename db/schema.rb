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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130427200515) do

  create_table "animals", :force => true do |t|
    t.string   "kind"
    t.string   "image"
    t.string   "state"
    t.string   "region"
    t.string   "unit"
    t.string   "hunter"
    t.integer  "spread_tip"
    t.integer  "spread_greatest"
    t.integer  "spread_inside"
    t.string   "alias"
    t.string   "certification"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "antlers", :force => true do |t|
    t.integer  "animal_id"
    t.integer  "parent_id"
    t.string   "certification"
    t.integer  "lg_mainbeam"
    t.integer  "lg_one"
    t.integer  "lg_two"
    t.integer  "lg_three"
    t.integer  "lg_four"
    t.integer  "lg_five"
    t.integer  "lg_six"
    t.integer  "lg_seven"
    t.integer  "circ_one"
    t.integer  "circ_two"
    t.integer  "circ_three"
    t.integer  "circ_four"
    t.string   "side"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "state"
    t.string   "kind"
  end

  create_table "points", :force => true do |t|
    t.integer  "antler_id"
    t.integer  "lg_point"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.integer  "user_id"
    t.integer  "animal_id"
    t.integer  "antler_id"
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "password_digest"
    t.string   "phone"
    t.string   "facebook_token"
    t.datetime "facebook_token_expiration"
  end

end
