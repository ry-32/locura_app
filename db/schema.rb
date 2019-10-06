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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20191006020049) do

  create_table "advertisers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "company_name"
    t.string   "industry"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.text     "content"
    t.string   "purpose"
    t.string   "lead"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deal_requests", force: :cascade do |t|
    t.string   "name"
    t.string   "company_name"
    t.string   "email"
    t.string   "industry"
    t.text     "memo"
    t.string   "campaign_schedule"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "status"
  end

  create_table "deals", force: :cascade do |t|
    t.integer  "advertiser_id"
    t.integer  "podcaster_id"
    t.text     "description"
    t.integer  "forecasted_dl"
    t.integer  "dl"
    t.integer  "cost"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "name"
  end

  create_table "podcasters", force: :cascade do |t|
    t.string   "name"
    t.string   "podcast_name"
    t.string   "email"
    t.string   "genre"
    t.text     "description"
    t.string   "url"
    t.string   "hosting"
    t.text     "memo"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

end
