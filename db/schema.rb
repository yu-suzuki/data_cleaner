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

ActiveRecord::Schema.define(version: 2018_08_07_065850) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "data_clean_tasks", force: :cascade do |t|
    t.integer "task_id", null: false
    t.string "task_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_data_clean_tasks_on_task_id", unique: true
  end

  create_table "options", force: :cascade do |t|
    t.bigint "data_clean_task_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_clean_task_id"], name: "index_options_on_data_clean_task_id"
  end

  create_table "target_tweets", force: :cascade do |t|
    t.bigint "tweet_id", default: 0, null: false
    t.bigint "data_clean_task_id"
    t.integer "decision"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["data_clean_task_id"], name: "index_target_tweets_on_data_clean_task_id"
  end

  add_foreign_key "options", "data_clean_tasks"
  add_foreign_key "target_tweets", "data_clean_tasks"
end
