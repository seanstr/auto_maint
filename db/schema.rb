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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160617182007) do

  create_table "automobiles", force: :cascade do |t|
    t.string   "automobile_type"
    t.string   "make"
    t.string   "model"
    t.integer  "year"
    t.integer  "odometer_reading"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "maintenance_tasks", force: :cascade do |t|
    t.datetime "maintenance_date"
    t.integer  "automobile_id"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "maintenance_tasks", ["automobile_id"], name: "index_maintenance_tasks_on_automobile_id"

end
