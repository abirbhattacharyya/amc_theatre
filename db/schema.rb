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

ActiveRecord::Schema.define(:version => 20110823104459) do

  create_table "movie_shows", :force => true do |t|
    t.string   "name"
    t.integer  "theatre_id"
    t.string   "show_time"
    t.string   "web_url"
    t.integer  "run_time"
    t.boolean  "imax"
    t.boolean  "etx"
    t.boolean  "threeD"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "theatres", :force => true do |t|
    t.string   "name"
    t.integer  "unit_number",   :limit => 8
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city"
    t.string   "state"
    t.integer  "zip",           :limit => 8
    t.string   "web_url"
    t.float    "lat"
    t.float    "lng"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
