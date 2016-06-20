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

ActiveRecord::Schema.define(version: 20160620202041) do

  create_table "automobiles", force: :cascade do |t|
    t.string   "make"
    t.string   "model"
    t.integer  "year"
    t.integer  "odometer_reading"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "fuel_mode"
  end

  create_table "automobiles_maintenance_tasks", force: :cascade do |t|
    t.integer "automobile_id"
    t.integer "maintenance_task_id"
  end

  add_index "automobiles_maintenance_tasks", ["automobile_id", "maintenance_task_id"], name: "automobiles_maintenance_task_index"

  create_table "maintenance_tasks", force: :cascade do |t|
    t.datetime "maintenance_date"
    t.integer  "automobile_id"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "suitable_for_gasoline"
    t.boolean  "suitable_for_diesel"
    t.boolean  "suitable_for_electrical"
  end

  add_index "maintenance_tasks", ["automobile_id"], name: "index_maintenance_tasks_on_automobile_id"

end
