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

ActiveRecord::Schema.define(:version => 20130930063251) do

  create_table "contracts", :force => true do |t|
    t.integer  "prep_application_id"
    t.string   "due_start_date"
    t.string   "due_start_time"
    t.datetime "due_end_time"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "duration"
    t.decimal  "amount"
    t.string   "status"
    t.integer  "feedback"
    t.string   "comments",            :limit => 5000
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.integer  "prepper_id"
    t.integer  "preppee_id"
    t.string   "session_id"
    t.string   "token"
  end

  create_table "educations", :force => true do |t|
    t.integer  "profile_id"
    t.string   "from"
    t.string   "to"
    t.string   "school"
    t.integer  "degree"
    t.string   "area_of_study"
    t.string   "comments",      :limit => 5000
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "job_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "language_skills", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "messages", :force => true do |t|
    t.integer  "prep_application_id"
    t.string   "from"
    t.string   "to"
    t.string   "subject"
    t.string   "body"
    t.string   "message_type"
    t.string   "attachment"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "other_experiences", :force => true do |t|
    t.integer  "profile_id"
    t.string   "name"
    t.string   "description", :limit => 5000
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "prep_applications", :force => true do |t|
    t.integer  "user_id"
    t.integer  "prep_id"
    t.string   "cover_letter"
    t.string   "status"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "preps", :force => true do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.string   "title"
    t.string   "prep_type"
    t.integer  "job_type_id"
    t.string   "required_skills"
    t.string   "description",                 :limit => 5000
    t.string   "status"
    t.string   "attachment_url_file_name"
    t.string   "attachment_url_content_type"
    t.integer  "attachment_url_file_size"
    t.datetime "attachment_url_updated_at"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  create_table "pro_experiences", :force => true do |t|
    t.integer  "profile_id"
    t.string   "title"
    t.string   "company_name"
    t.string   "location"
    t.string   "from"
    t.string   "to"
    t.string   "description",  :limit => 5000
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.decimal  "price"
    t.integer  "product_type"
    t.integer  "session_type"
    t.integer  "session_length"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.string   "book_url_file_name"
    t.string   "book_url_content_type"
    t.integer  "book_url_file_size"
    t.datetime "book_url_updated_at"
    t.string   "description",           :limit => 5000
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", :force => true do |t|
    t.integer  "user_id"
    t.string   "token"
    t.string   "title"
    t.string   "address"
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.string   "zipcode"
    t.string   "phone"
    t.decimal  "feedback"
    t.integer  "year_of_experience",                 :default => 0
    t.string   "language",                           :default => "0"
    t.string   "overview",           :limit => 5000
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
    t.string   "card_number"
    t.string   "payment_method"
    t.datetime "expire_date"
    t.string   "ccvn"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "skill_tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "skills", :force => true do |t|
    t.integer  "profile_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
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
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "first_name",             :default => ""
    t.string   "last_name",              :default => ""
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

end
