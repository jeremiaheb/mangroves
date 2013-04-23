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

ActiveRecord::Schema.define(:version => 20130423122907) do

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
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "diver_id"
    t.string   "field_id"
    t.string   "season"
    t.string   "strata"
    t.date     "date"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.decimal  "temperature"
    t.decimal  "dissolved_oxygen"
    t.decimal  "salinity"
    t.decimal  "avg_depth"
    t.decimal  "visibility"
  end

end
