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

ActiveRecord::Schema.define(:version => 20111016180006) do

  create_table "beta_codes", :force => true do |t|
    t.string   "code"
    t.boolean  "used",       :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "flickr_tags"
    t.string   "title"
    t.text     "description"
    t.string   "slug"
    t.integer  "position"
    t.integer  "portfolio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.string   "flickr_set_id"
    t.integer  "remote_account_id"
    t.string   "facebook_album_id"
  end

  create_table "future_users", :force => true do |t|
    t.string   "email"
    t.boolean  "handled",    :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", :force => true do |t|
    t.string   "large_photo_url"
    t.string   "small_photo_url"
    t.string   "flickr_photo_id"
    t.text     "title"
    t.text     "description"
    t.integer  "category_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "flickr_id"
    t.string   "facebook_photo_id"
    t.boolean  "deleted",           :default => false
    t.integer  "prints",            :default => 0
  end

  create_table "portfolios", :force => true do |t|
    t.text     "description"
    t.string   "title"
    t.text     "footer"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "css"
    t.integer  "theme_id"
    t.string   "slug"
    t.string   "google_analytics_code"
    t.boolean  "facebook_share",        :default => false
  end

  create_table "remote_accounts", :force => true do |t|
    t.string   "remote_user_name"
    t.integer  "portfolio_id"
    t.string   "remote_user_id"
    t.string   "remote_user_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.string   "remote_profile_url"
    t.string   "access_token"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_admin"
    t.string   "login"
    t.string   "beta_code"
  end

end
