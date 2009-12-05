# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 0) do

  create_table "cities", :force => true do |t|
    t.integer  "state_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "districts", :force => true do |t|
    t.integer  "city_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meetings", :force => true do |t|
    t.time    "initial_hour",      :null => false
    t.time    "final_hour",        :null => false
    t.integer "place_id",          :null => false
    t.boolean "exchanged_glances", :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_places", :id => false, :force => true do |t|
    t.integer "place_id"
    t.integer "category_id"
  end

  create_table "places", :force => true do |t|
    t.string   "description", :limit => 100
    t.integer  "district_id"
    t.text     "tags"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", :force => true do |t|
    t.integer  "user_id"
    t.string   "first_name",     :limit => 30,  :null => false
    t.string   "last_name",      :limit => 30,  :null => false
    t.string   "sex",            :limit => 1,   :null => false
    t.string   "orientation",                   :null => false
    t.string   "visible_fields", :limit => 300
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", :force => true do |t|
    t.string "name", :limit => 100
    t.string "uf",   :limit => 2
  end

  create_table "users", :force => true do |t|
    t.string   "username",          :null => false
    t.string   "email",             :null => false
    t.string   "crypted_password",  :null => false
    t.string   "password_salt",     :null => false
    t.string   "persistence_token", :null => false
    t.datetime "last_login_at"
    t.integer  "login_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
