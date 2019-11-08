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

ActiveRecord::Schema.define(version: 20191108040304) do

  create_table "advertisers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "company_name"
    t.string   "industry"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "password_digest"
    t.text     "biz_description", limit: 65535
    t.string   "hp_url"
  end

  create_table "contacts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.text     "content",    limit: 16777215
    t.string   "purpose"
    t.string   "lead"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "deal_requests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "company_name"
    t.string   "email"
    t.string   "industry"
    t.text     "memo",              limit: 16777215
    t.string   "campaign_schedule"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "status"
  end

  create_table "deals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "advertiser_id"
    t.integer  "podcaster_id"
    t.text     "description",   limit: 16777215
    t.integer  "forecasted_dl"
    t.integer  "dl"
    t.integer  "cost"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "name"
    t.string   "status"
    t.integer  "episode_id"
    t.integer  "pre_roll_30"
    t.integer  "pre_roll_60"
    t.integer  "mid_roll_30"
    t.integer  "mid_roll_60"
    t.integer  "post_roll_30"
    t.integer  "post_roll_60"
  end

  create_table "dl_confirmations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dl_files", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "program_id"
    t.integer  "podcaster_id"
    t.string   "file"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "episodes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "program_id"
    t.string   "name"
    t.string   "date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "pre_roll_30"
    t.integer  "pre_roll_60"
    t.integer  "mid_roll_30"
    t.integer  "mid_roll_60"
    t.integer  "post_roll_30"
    t.integer  "post_roll_60"
  end

  create_table "podcasters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "prof_file"
  end

  create_table "programs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "description", limit: 16777215
    t.string   "genre"
    t.integer  "dl"
    t.string   "hosting"
    t.string   "start_date"
    t.integer  "host_id"
    t.string   "program_url"
    t.string   "hp_url"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "cpm_30_pre"
    t.integer  "cpm_60_pre"
    t.integer  "cpm_30_mid"
    t.integer  "cpm_60_mid"
    t.integer  "cpm_30_post"
    t.integer  "cpm_60_post"
    t.string   "prof_file"
    t.string   "dlfile"
  end

end
