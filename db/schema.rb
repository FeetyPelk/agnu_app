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

ActiveRecord::Schema.define(:version => 20130508105023) do

  create_table "bappos", :force => true do |t|
    t.string   "name"
    t.string   "team"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "bb_date_dim_moveo", :id => false, :force => true do |t|
    t.integer "date_key",              :limit => 8,  :null => false
    t.date    "the_date"
    t.string  "calendar_year",         :limit => 15
    t.string  "calendar_yearmonth",    :limit => 15
    t.string  "calendar_yearmonthday", :limit => 15
    t.integer "julian",                :limit => 8
    t.string  "dayofweek",             :limit => 15
    t.string  "monthofyear",           :limit => 15
    t.string  "weekend",               :limit => 7
  end

  create_table "bb_date_dim_moveo_mini", :id => false, :force => true do |t|
    t.integer "date_key",              :limit => 8
    t.date    "the_date"
    t.string  "calendar_year",         :limit => 15
    t.string  "calendar_yearmonth",    :limit => 15
    t.string  "calendar_yearmonthday", :limit => 15
    t.integer "julian",                :limit => 8
    t.string  "dayofweek",             :limit => 15
    t.string  "monthofyear",           :limit => 15
    t.string  "weekend",               :limit => 7
  end

  create_table "bb_date_dims", :force => true do |t|
    t.date     "the_date"
    t.string   "calendar_year"
    t.string   "calendar_yearmonth"
    t.string   "calendar_yearmonthday"
    t.integer  "julian"
    t.string   "dayofweek"
    t.string   "monthofyear"
    t.string   "weekend"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "bb_date_dims", ["the_date"], :name => "idx_b_date_dim_thedate"

  create_table "earned_dims", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "ppn_id"
    t.integer "field"
    t.integer "game_key"
  end

  add_index "earned_dims", ["field"], :name => "idx_effield_key"

  create_table "earned_facts", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "ppn_id"
    t.integer "field"
    t.integer "game_key"
  end

  add_index "earned_facts", ["game_key"], :name => "idx_efgame_key"
  add_index "earned_facts", ["ppn_id"], :name => "idx_efppn_key"

  create_table "earned_hoody", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "ppn_id"
    t.integer "field"
    t.integer "game_key"
  end

  create_table "fielder_dim_moveo", :id => false, :force => true do |t|
    t.integer "field_key"
    t.integer "pitcher_key"
    t.integer "catcher_key"
    t.integer "first_base_key"
    t.integer "second_base_key"
    t.integer "third_base_key"
    t.integer "shortstop_key"
    t.integer "left_field_key"
    t.integer "center_field_key"
    t.integer "right_field_key"
    t.string  "pitcher",          :limit => 70
    t.string  "catcher",          :limit => 70
    t.string  "first_base",       :limit => 70
    t.string  "second_base",      :limit => 70
    t.string  "third_base",       :limit => 70
    t.string  "shortstop",        :limit => 70
    t.string  "left_field",       :limit => 70
    t.string  "center_field",     :limit => 70
    t.string  "right_field",      :limit => 70
    t.integer "is_current"
    t.date    "date_from"
    t.date    "date_to"
  end

  create_table "fielder_dim_moveo_mini", :id => false, :force => true do |t|
    t.integer "field_key"
    t.integer "pitcher_key"
    t.integer "catcher_key"
    t.integer "first_base_key"
    t.integer "second_base_key"
    t.integer "third_base_key"
    t.integer "shortstop_key"
    t.integer "left_field_key"
    t.integer "center_field_key"
    t.integer "right_field_key"
    t.string  "pitcher",          :limit => 70
    t.string  "catcher",          :limit => 70
    t.string  "first_base",       :limit => 70
    t.string  "second_base",      :limit => 70
    t.string  "third_base",       :limit => 70
    t.string  "shortstop",        :limit => 70
    t.string  "left_field",       :limit => 70
    t.string  "center_field",     :limit => 70
    t.string  "right_field",      :limit => 70
    t.integer "is_current"
    t.date    "date_from"
    t.date    "date_to"
  end

  create_table "fielder_dims", :force => true do |t|
    t.integer  "pitcher_key"
    t.integer  "catcher_key"
    t.integer  "first_base_key"
    t.integer  "second_base_key"
    t.integer  "third_base_key"
    t.integer  "shortstop_key"
    t.integer  "left_field_key"
    t.integer  "center_field_key"
    t.integer  "right_field_key"
    t.string   "pitcher"
    t.string   "catcher"
    t.string   "first_base"
    t.string   "second_base"
    t.string   "third_base"
    t.string   "shortstop"
    t.string   "left_field"
    t.string   "center_field"
    t.string   "right_field"
    t.integer  "is_current"
    t.date     "date_from"
    t.date     "date_to"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "fielder_dims", ["id"], :name => "idx_id_fielder_dims"
  add_index "fielder_dims", ["pitcher_key"], :name => "idx_fd_pitcher_key"

  create_table "fielder_dims_0221", :id => false, :force => true do |t|
    t.integer  "id"
    t.integer  "pitcher_key"
    t.integer  "catcher_key"
    t.integer  "first_base_key"
    t.integer  "second_base_key"
    t.integer  "third_base_key"
    t.integer  "shortstop_key"
    t.integer  "left_field_key"
    t.integer  "center_field_key"
    t.integer  "right_field_key"
    t.string   "pitcher"
    t.string   "catcher"
    t.string   "first_base"
    t.string   "second_base"
    t.string   "third_base"
    t.string   "shortstop"
    t.string   "left_field"
    t.string   "center_field"
    t.string   "right_field"
    t.integer  "is_current"
    t.date     "date_from"
    t.date     "date_to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "game_dim_moveo", :id => false, :force => true do |t|
    t.integer "game_key"
    t.string  "game_id",      :limit => 12
    t.string  "home_team",    :limit => 3
    t.string  "visitor_team", :limit => 3
    t.date    "deboot"
    t.integer "is_current"
    t.date    "date_from"
    t.date    "date_to"
  end

  create_table "game_dim_moveo_mini", :id => false, :force => true do |t|
    t.integer "game_key"
    t.string  "game_id",      :limit => 12
    t.string  "home_team",    :limit => 3
    t.string  "visitor_team", :limit => 3
    t.date    "deboot"
    t.integer "is_current"
    t.date    "date_from"
    t.date    "date_to"
  end

  create_table "game_dims", :force => true do |t|
    t.string   "game_id"
    t.string   "home_team"
    t.string   "visitor_team"
    t.date     "deboot"
    t.integer  "is_current"
    t.date     "date_from"
    t.date     "date_to"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "game_dims_0221", :id => false, :force => true do |t|
    t.integer  "id"
    t.string   "game_id"
    t.string   "home_team"
    t.string   "visitor_team"
    t.date     "deboot"
    t.integer  "is_current"
    t.date     "date_from"
    t.date     "date_to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hoody", :id => false, :force => true do |t|
    t.integer "ppn_id"
    t.integer "date_key"
    t.integer "game_key"
    t.integer "field_key"
    t.integer "player_key"
    t.integer "at_bat"
    t.integer "hit"
    t.integer "walk"
    t.integer "hbp"
    t.integer "sacfly"
    t.integer "bat_team_key"
    t.integer "field_team_key"
    t.integer "made_outs"
    t.integer "ern_b"
    t.integer "ern_1"
    t.integer "ern_2"
    t.integer "ern_3"
  end

  create_table "oink_bb_date_dims", :force => true do |t|
    t.date     "the_date"
    t.string   "calendar_year"
    t.string   "calendar_yearmonth"
    t.string   "calendar_yearmonthday"
    t.integer  "julian"
    t.string   "dayofweek"
    t.string   "monthofyear"
    t.string   "weekend"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "oink_fielder_dims", :force => true do |t|
    t.integer  "pitcher_key"
    t.integer  "catcher_key"
    t.integer  "first_base_key"
    t.integer  "second_base_key"
    t.integer  "third_base_key"
    t.integer  "shortstop_key"
    t.integer  "left_field_key"
    t.integer  "center_field_key"
    t.integer  "right_field_key"
    t.string   "pitcher"
    t.string   "catcher"
    t.string   "first_base"
    t.string   "second_base"
    t.string   "third_base"
    t.string   "shortstop"
    t.string   "left_field"
    t.string   "center_field"
    t.string   "right_field"
    t.integer  "is_current"
    t.date     "date_from"
    t.date     "date_to"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "oink_game_dims", :force => true do |t|
    t.string   "game_id"
    t.string   "home_team"
    t.string   "visitor_team"
    t.date     "deboot"
    t.integer  "is_current"
    t.date     "date_from"
    t.date     "date_to"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "oink_play_facts", :force => true do |t|
    t.integer  "game_key"
    t.integer  "player_key"
    t.integer  "field_key"
    t.integer  "date_key"
    t.integer  "at_bat"
    t.integer  "hit"
    t.integer  "walk"
    t.integer  "bag"
    t.integer  "rbi"
    t.integer  "balls"
    t.integer  "strikes"
    t.integer  "pitches"
    t.integer  "fielded_by"
    t.integer  "assist_1"
    t.integer  "assist_2"
    t.integer  "out_by"
    t.integer  "at_home"
    t.integer  "bat_team_key"
    t.integer  "field_team_key"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "oink_player_dims", :force => true do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "player_name"
    t.string   "player_id"
    t.date     "deboot"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "oink_team_dims", :force => true do |t|
    t.string   "id3"
    t.string   "id3_old"
    t.string   "league"
    t.string   "diviz"
    t.string   "loc"
    t.string   "namo"
    t.string   "nick"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "peedees", :force => true do |t|
    t.date     "deboot"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "player_id"
    t.string   "player_name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "peedees_hold", :id => false, :force => true do |t|
    t.integer  "id"
    t.date     "deboot"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "player_id"
    t.string   "player_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pinwit", :id => false, :force => true do |t|
    t.integer  "id"
    t.string   "batter"
    t.string   "boozer"
    t.integer  "game_key"
    t.integer  "field_key"
    t.integer  "date_key"
    t.integer  "at_bat"
    t.integer  "hit"
    t.integer  "walk"
    t.integer  "bag"
    t.integer  "rbi"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plabbies", :force => true do |t|
    t.string   "batter"
    t.string   "pitcher"
    t.integer  "game_key"
    t.integer  "field_key"
    t.integer  "date_key"
    t.integer  "at_bat"
    t.integer  "hit"
    t.integer  "walk"
    t.integer  "bag"
    t.integer  "rbi"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "plabbies_0804", :id => false, :force => true do |t|
    t.integer  "id"
    t.string   "batter"
    t.string   "pitcher"
    t.integer  "game_key"
    t.integer  "field_key"
    t.integer  "date_key"
    t.integer  "at_bat"
    t.integer  "hit"
    t.integer  "walk"
    t.integer  "bag"
    t.integer  "rbi"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plabs", :force => true do |t|
    t.string   "batter"
    t.string   "on_first"
    t.string   "on_second"
    t.string   "on_third"
    t.string   "pitcher"
    t.string   "catcher"
    t.string   "first_base"
    t.string   "second_base"
    t.string   "third_base"
    t.string   "shortstop"
    t.string   "left_field"
    t.string   "center_field"
    t.string   "right_field"
    t.string   "bat_team"
    t.string   "field_team"
    t.integer  "at_home"
    t.integer  "at_bat"
    t.integer  "hit"
    t.integer  "walk"
    t.integer  "rbi"
    t.integer  "bag"
    t.integer  "ball"
    t.integer  "strike"
    t.integer  "out"
    t.decimal  "avg"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "play_facts", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "game_key"
    t.integer "player_key"
    t.integer "field_key"
    t.integer "date_key"
    t.integer "at_bat"
    t.integer "hit"
    t.integer "walk"
    t.integer "bag"
    t.integer "rbi"
    t.integer "runs"
    t.integer "earned_runs"
    t.integer "balls"
    t.integer "strikes"
    t.integer "pitches"
    t.integer "hbp"
    t.integer "sacfly"
    t.integer "fielded_by"
    t.integer "assist_1"
    t.integer "assist_2"
    t.integer "out_by"
    t.integer "at_home"
    t.integer "bat_team_key"
    t.integer "field_team_key"
    t.integer "run1"
    t.integer "run1_field"
    t.integer "run1_era"
    t.integer "run2"
    t.integer "run2_field"
    t.integer "run2_era"
    t.integer "run3"
    t.integer "run3_field"
    t.integer "run3_era"
    t.integer "bi_b"
    t.integer "bi_1"
    t.integer "bi_2"
    t.integer "bi_3"
    t.integer "made_outs"
    t.integer "ern_b"
    t.integer "ern_1"
    t.integer "ern_2"
    t.integer "ern_3"
    t.integer "inning"
    t.integer "a_outs"
    t.integer "sb_outs"
  end

  add_index "play_facts", ["date_key"], :name => "idx_pf_date_key"
  add_index "play_facts", ["date_key"], :name => "idx_playfacts_date_key_n"
  add_index "play_facts", ["field_key"], :name => "idx_playfacts_field_key_n"
  add_index "play_facts", ["game_key"], :name => "idx_pf_game"
  add_index "play_facts", ["id"], :name => "idx_pf_id"
  add_index "play_facts", ["id"], :name => "idx_playfacts_id_n"
  add_index "play_facts", ["player_key"], :name => "idx_pf_player_key"
  add_index "play_facts", ["player_key"], :name => "idx_playfacts_player_key_n"

  create_table "play_facts_0305", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "game_key"
    t.integer "player_key"
    t.integer "field_key"
    t.integer "date_key"
    t.integer "at_bat"
    t.integer "hit"
    t.integer "walk"
    t.integer "bag"
    t.integer "rbi"
    t.integer "runs"
    t.integer "earned_runs"
    t.integer "balls"
    t.integer "strikes"
    t.integer "pitches"
    t.integer "hbp"
    t.integer "sacfly"
    t.integer "fielded_by"
    t.integer "assist_1"
    t.integer "assist_2"
    t.integer "out_by"
    t.integer "at_home"
    t.integer "bat_team_key"
    t.integer "field_team_key"
    t.integer "run1"
    t.integer "run1_field"
    t.integer "run1_era"
    t.integer "run2"
    t.integer "run2_field"
    t.integer "run2_era"
    t.integer "run3"
    t.integer "run3_field"
    t.integer "run3_era"
    t.integer "bi_b"
    t.integer "bi_1"
    t.integer "bi_2"
    t.integer "bi_3"
    t.integer "made_outs"
    t.integer "ern_b"
    t.integer "ern_1"
    t.integer "ern_2"
    t.integer "ern_3"
    t.integer "inning"
    t.integer "a_outs"
    t.integer "sb_outs"
  end

  create_table "play_facts_100", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "game_key"
    t.integer "player_key"
    t.integer "field_key"
    t.integer "date_key"
    t.integer "at_bat"
    t.integer "hit"
    t.integer "walk"
    t.integer "bag"
    t.integer "rbi"
    t.integer "runs"
    t.integer "earned_runs"
    t.integer "balls"
    t.integer "strikes"
    t.integer "pitches"
    t.integer "hbp"
    t.integer "sacfly"
    t.integer "fielded_by"
    t.integer "assist_1"
    t.integer "assist_2"
    t.integer "out_by"
    t.integer "at_home"
    t.integer "bat_team_key"
    t.integer "field_team_key"
    t.integer "run1"
    t.integer "run1_field"
    t.integer "run1_era"
    t.integer "run2"
    t.integer "run2_field"
    t.integer "run2_era"
    t.integer "run3"
    t.integer "run3_field"
    t.integer "run3_era"
    t.integer "bi_home"
    t.integer "bi_1"
    t.integer "bi_2"
    t.integer "bi_3"
    t.integer "made_outs"
    t.integer "inning"
    t.integer "a_outs"
    t.integer "sb_outs"
  end

  create_table "play_facts_moveo", :id => false, :force => true do |t|
    t.integer "ppn_id"
    t.integer "game_key"
    t.integer "player_key"
    t.integer "field_key"
    t.integer "date_key"
    t.integer "at_bat"
    t.integer "hit"
    t.integer "walk"
    t.integer "bases"
    t.integer "rbi"
    t.integer "balls"
    t.integer "strikes"
    t.integer "pitches"
    t.integer "fielded_by"
    t.integer "assist_1"
    t.integer "assist_2"
    t.integer "out_by"
    t.integer "at_home"
    t.integer "bat_team_key"
    t.integer "field_team_key"
  end

  create_table "play_facts_moveo_mini", :id => false, :force => true do |t|
    t.integer  "ppn_id"
    t.integer  "game_key"
    t.integer  "player_key"
    t.integer  "field_key"
    t.integer  "date_key"
    t.integer  "at_bat"
    t.integer  "hit"
    t.integer  "walk"
    t.integer  "bases"
    t.integer  "rbi"
    t.integer  "balls"
    t.integer  "strikes"
    t.integer  "pitches"
    t.integer  "fielded_by"
    t.integer  "assist_1"
    t.integer  "assist_2"
    t.integer  "out_by"
    t.integer  "at_home"
    t.integer  "bat_team_key"
    t.integer  "field_team_key"
    t.integer  "id"
    t.string   "id3"
    t.string   "id3_old"
    t.string   "league"
    t.string   "diviz"
    t.string   "loc"
    t.string   "namo"
    t.string   "nick"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "play_facts_old", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "game_key"
    t.integer "player_key"
    t.integer "field_key"
    t.integer "date_key"
    t.integer "at_bat"
    t.integer "hit"
    t.integer "walk"
    t.integer "bag"
    t.integer "rbi"
    t.integer "balls"
    t.integer "strikes"
    t.integer "pitches"
    t.integer "fielded_by"
    t.integer "assist_1"
    t.integer "assist_2"
    t.integer "out_by"
    t.integer "at_home"
    t.integer "bat_team_key"
    t.integer "field_team_key"
    t.integer "run1"
    t.integer "run1_field"
    t.integer "run1_era"
    t.integer "run2"
    t.integer "run2_field"
    t.integer "run2_era"
    t.integer "run3"
    t.integer "run3_field"
    t.integer "run3_era"
    t.integer "bi_home"
    t.integer "bi_1"
    t.integer "bi_2"
    t.integer "bi_3"
    t.integer "made_outs"
    t.integer "inning"
    t.integer "a_outs"
    t.integer "sb_outs"
  end

  create_table "play_facts_pisso", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "game_key"
    t.integer "player_key"
    t.integer "field_key"
    t.integer "date_key"
    t.integer "at_bat"
    t.integer "hit"
    t.integer "walk"
    t.integer "bag"
    t.integer "rbi"
    t.integer "runs"
    t.integer "earned_runs"
    t.integer "balls"
    t.integer "strikes"
    t.integer "pitches"
    t.integer "hbp"
    t.integer "sacfly"
    t.integer "fielded_by"
    t.integer "assist_1"
    t.integer "assist_2"
    t.integer "out_by"
    t.integer "at_home"
    t.integer "bat_team_key"
    t.integer "field_team_key"
    t.integer "run1"
    t.integer "run1_field"
    t.integer "run1_era"
    t.integer "run2"
    t.integer "run2_field"
    t.integer "run2_era"
    t.integer "run3"
    t.integer "run3_field"
    t.integer "run3_era"
    t.integer "bi_home"
    t.integer "bi_1"
    t.integer "bi_2"
    t.integer "bi_3"
    t.integer "made_outs"
    t.integer "inning"
    t.integer "a_outs"
    t.integer "sb_outs"
  end

  create_table "play_facts_small", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "game_key"
    t.integer "player_key"
    t.integer "field_key"
    t.integer "date_key"
    t.integer "at_bat"
    t.integer "hit"
    t.integer "walk"
    t.integer "bag"
    t.integer "rbi"
    t.integer "balls"
    t.integer "strikes"
    t.integer "pitches"
    t.integer "fielded_by"
    t.integer "assist_1"
    t.integer "assist_2"
    t.integer "out_by"
    t.integer "at_home"
    t.integer "bat_team_key"
    t.integer "field_team_key"
    t.integer "run1"
    t.integer "run1_field"
    t.integer "run1_era"
    t.integer "run2"
    t.integer "run2_field"
    t.integer "run2_era"
    t.integer "run3"
    t.integer "run3_field"
    t.integer "run3_era"
    t.integer "bi_home"
    t.integer "bi_1"
    t.integer "bi_2"
    t.integer "bi_3"
    t.integer "made_outs"
    t.integer "inning"
    t.integer "a_outs"
    t.integer "sb_outs"
  end

  create_table "player_dim_moveo", :id => false, :force => true do |t|
    t.integer "player_key"
    t.string  "last_name",  :limit => 30
    t.string  "first_name", :limit => 30
    t.string  "player_id",  :limit => 10
    t.date    "deboot"
  end

  create_table "player_dim_moveo_mini", :id => false, :force => true do |t|
    t.integer "player_key"
    t.string  "last_name",  :limit => 30
    t.string  "first_name", :limit => 30
    t.string  "player_id",  :limit => 10
    t.date    "deboot"
  end

  create_table "player_dims", :force => true do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.string   "player_name"
    t.string   "player_id"
    t.date     "deboot"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "playfacts_012314", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "game_key"
    t.integer "player_key"
    t.integer "field_key"
    t.integer "date_key"
    t.integer "at_bat"
    t.integer "hit"
    t.integer "walk"
    t.integer "bag"
    t.integer "rbi"
    t.integer "runs"
    t.integer "earned_runs"
    t.integer "balls"
    t.integer "strikes"
    t.integer "pitches"
    t.integer "hbp"
    t.integer "sacfly"
    t.integer "fielded_by"
    t.integer "assist_1"
    t.integer "assist_2"
    t.integer "out_by"
    t.integer "at_home"
    t.integer "bat_team_key"
    t.integer "field_team_key"
    t.integer "run1"
    t.integer "run1_field"
    t.integer "run1_era"
    t.integer "run2"
    t.integer "run2_field"
    t.integer "run2_era"
    t.integer "run3"
    t.integer "run3_field"
    t.integer "run3_era"
    t.integer "bi_home"
    t.integer "bi_1"
    t.integer "bi_2"
    t.integer "bi_3"
    t.integer "made_outs"
    t.integer "inning"
    t.integer "a_outs"
    t.integer "sb_outs"
  end

  create_table "plays", :force => true do |t|
    t.integer  "game_key"
    t.integer  "player_key"
    t.integer  "fieldkey"
    t.integer  "date_key"
    t.integer  "at_bat"
    t.integer  "hit"
    t.integer  "walk"
    t.integer  "bag"
    t.integer  "rbi"
    t.integer  "pitcher_key"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "team_dim_moveo", :id => false, :force => true do |t|
    t.integer "team_key"
    t.string  "id3",        :limit => 3
    t.string  "id3_old",    :limit => 3
    t.string  "league",     :limit => 5
    t.string  "diviz",      :limit => 15
    t.string  "loc",        :limit => 25
    t.string  "name",       :limit => 25
    t.string  "nick",       :limit => 25
    t.date    "start_date"
    t.date    "end_date"
    t.string  "city",       :limit => 25
    t.string  "state",      :limit => 2
  end

  create_table "team_dim_moveo_mini", :id => false, :force => true do |t|
    t.integer "team_key"
    t.string  "id3",        :limit => 3
    t.string  "id3_old",    :limit => 3
    t.string  "league",     :limit => 5
    t.string  "diviz",      :limit => 15
    t.string  "loc",        :limit => 25
    t.string  "name",       :limit => 25
    t.string  "nick",       :limit => 25
    t.date    "start_date"
    t.date    "end_date"
    t.string  "city",       :limit => 25
    t.string  "state",      :limit => 2
  end

  create_table "team_dims", :force => true do |t|
    t.string   "id3"
    t.string   "id3_old"
    t.string   "league"
    t.string   "diviz"
    t.string   "loc"
    t.string   "namo"
    t.string   "nick"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
