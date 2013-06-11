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

ActiveRecord::Schema.define(version: 20130611044257) do

  create_table "characters", force: true do |t|
    t.string   "name"
    t.string   "init_mod"
    t.string   "init_score"
    t.string   "hp"
    t.string   "strength"
    t.string   "agility"
    t.string   "stamina"
    t.string   "personality"
    t.string   "intelligence"
    t.string   "luck"
    t.string   "reflex"
    t.string   "fortitude"
    t.string   "will"
    t.string   "alignment"
    t.string   "occupation"
    t.string   "player_class"
    t.string   "player"
    t.string   "speed"
    t.text     "details"
    t.text     "lucky_roll"
    t.string   "ac"
    t.boolean  "in_combat"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "level"
  end

end
