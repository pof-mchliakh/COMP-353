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

ActiveRecord::Schema.define(:version => 20120728203921) do

  create_table "Address", :primary_key => "ID", :force => true do |t|
    t.string  "streetName"
    t.integer "apt"
    t.string  "city"
    t.string  "postalcode", :limit => 6
  end

  create_table "Person", :primary_key => "ID", :force => true do |t|
    t.string  "fName"
    t.string  "lName"
    t.integer "telephone"
    t.integer "addressID"
  end

  add_index "Person", ["addressID"], :name => "addressID"

  create_table "post", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
