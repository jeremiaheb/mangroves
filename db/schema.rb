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

ActiveRecord::Schema.define(:version => 20130507171832) do

  create_table "animals", :force => true do |t|
    t.string   "spp_code"
    t.string   "scientific_name"
    t.string   "common_name"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "divers", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
    t.string   "role"
  end

  add_index "divers", ["email"], :name => "index_divers_on_email", :unique => true
  add_index "divers", ["reset_password_token"], :name => "index_divers_on_reset_password_token", :unique => true

  create_table "reference_sites", :force => true do |t|
    t.string   "name"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.string   "strata"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sample_animals", :force => true do |t|
    t.integer  "sample_id"
    t.integer  "animal_id"
    t.integer  "number_individuals"
    t.integer  "average_length"
    t.integer  "min_length"
    t.integer  "max_length"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "samples", :force => true do |t|
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "diver_id"
    t.date     "sample_date"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.decimal  "temperature"
    t.decimal  "dissolved_oxygen"
    t.decimal  "salinity"
    t.decimal  "visibility"
    t.string   "running_site"
    t.string   "reference_site"
    t.time     "sample_time"
    t.decimal  "ph"
    t.decimal  "depth_meter_0"
    t.decimal  "depth_meter_15"
    t.decimal  "depth_meter_30"
    t.integer  "shoreline_cd"
    t.text     "mangrove_spp"
    t.text     "underwater_habitat"
    t.decimal  "canopy_width"
    t.decimal  "canopy_height"
    t.text     "notes"
  end

end
