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

ActiveRecord::Schema.define(:version => 20130804193702) do

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "blogs", :force => true do |t|
    t.string   "title"
    t.text     "article"
    t.string   "image"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "messages", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "schools", :force => true do |t|
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "setting"
    t.string   "school_type"
    t.string   "yellow",               :default => "unknown"
    t.integer  "population"
    t.string   "url"
    t.string   "remedial"
    t.string   "counseling"
    t.string   "employment"
    t.string   "placement"
    t.string   "daycare"
    t.string   "tribal"
    t.string   "religious"
    t.string   "historically_black"
    t.string   "fitness"
    t.string   "family_housing"
    t.string   "vet_housing"
    t.string   "first_year_housing"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.float    "longitude"
    t.float    "latitude"
    t.string   "gi_bill_accredited",   :default => "unknown"
    t.string   "vet_affairs",          :default => "unknown"
    t.string   "vet_tuition_waived",   :default => "unknown"
    t.string   "vet_scholarships",     :default => "unknown"
    t.string   "sat_waived",           :default => "unknown"
    t.string   "vet_clubhouse",        :default => "unknown"
    t.string   "mentor",               :default => "unknown"
    t.string   "student_vets_america", :default => "unknown"
    t.string   "vet_orientation",      :default => "unknown"
    t.string   "iped"
  end

  create_table "users", :force => true do |t|
    t.boolean  "admin",                  :default => false
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
