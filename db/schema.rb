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

ActiveRecord::Schema.define(:version => 20110619185904) do

  create_table "beta_codes", :force => true do |t|
    t.string   "code"
    t.boolean  "used",       :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "tags"
    t.string   "title"
    t.text     "description"
    t.string   "slug"
    t.integer  "position"
    t.integer  "portfolio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.string   "flickr_set_id"
  end

  create_table "photos", :force => true do |t|
    t.string   "flickr_url_b"
    t.string   "flickr_url_s"
    t.string   "flickr_photo_id"
    t.text     "title"
    t.text     "description"
    t.integer  "category_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "flickr_id"
  end

  create_table "portfolios", :force => true do |t|
    t.text     "description"
    t.string   "title"
    t.text     "footer"
    t.string   "flickr_user_name"
    t.string   "flickr_user_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "flickr_user_email"
    t.text     "css"
    t.integer  "theme_id"
    t.string   "slug"
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
