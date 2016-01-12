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

ActiveRecord::Schema.define(:version => 20150112110110) do

  create_table "articles", :force => true do |t|
    t.text     "title"
    t.text     "body"
    t.integer  "author_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "articles", ["author_id"], :name => "index_articles_on_author_id"

  create_table "authors", :force => true do |t|
    t.text     "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "bappos", :force => true do |t|
    t.string   "name"
    t.string   "team"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "batters_200", :id => false, :force => true do |t|
    t.integer "id"
    t.string  "c2"
    t.integer "c101"
    t.string  "c1"
    t.integer "c4",   :limit => 8
    t.integer "c5",   :limit => 8
    t.integer "c6",   :limit => 8
    t.integer "c7",   :limit => 8
    t.integer "c13",  :limit => 8
    t.integer "c12",  :limit => 8
    t.integer "c14",  :limit => 8
    t.integer "c8",   :limit => 8
    t.decimal "c3"
    t.decimal "c18"
    t.decimal "c19"
    t.decimal "c17"
    t.decimal "c15"
    t.decimal "c16"
    t.decimal "c9"
    t.decimal "c10"
    t.decimal "c11"
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

  add_index "bb_date_dims", ["calendar_yearmonthday"], :name => "idx_dd_calendar_yearmonthday"
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
    t.integer "bat_team_key"
    t.integer "field_team_key"
    t.integer "batter_key"
  end

  add_index "earned_facts", ["batter_key", "game_key", "field"], :name => "idx_efthreebee_key"
  add_index "earned_facts", ["batter_key", "game_key"], :name => "idx_efbattergame_key"
  add_index "earned_facts", ["batter_key"], :name => "idx_efbatter_key"
  add_index "earned_facts", ["game_key"], :name => "idx_efgame_key"
  add_index "earned_facts", ["ppn_id"], :name => "idx_efppn_key"

  create_table "earned_facts_agnu", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "ern_3"
    t.integer "ern_2"
    t.integer "ern_1"
    t.integer "ern_b"
  end

  add_index "earned_facts_agnu", ["id"], :name => "idx_efappn_key"

  create_table "earned_facts_fat", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "ppn_id"
    t.integer "batter_key"
    t.integer "ern_3"
    t.integer "ern_2"
    t.integer "ern_1"
    t.integer "ern_b"
  end

  add_index "earned_facts_fat", ["batter_key"], :name => "idx_effbatter_key"
  add_index "earned_facts_fat", ["ern_1"], :name => "idx_effern1_key"
  add_index "earned_facts_fat", ["ern_2"], :name => "idx_effern2_key"
  add_index "earned_facts_fat", ["ern_3"], :name => "idx_effern3_key"
  add_index "earned_facts_fat", ["ern_b"], :name => "idx_effernb_key"
  add_index "earned_facts_fat", ["ppn_id"], :name => "idx_effppnid_key"

  create_table "earned_facts_fat_first_run", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "ppn_id"
    t.integer "game_key"
    t.integer "ern_3"
    t.integer "ern_2"
    t.integer "ern_1"
    t.integer "ern_b"
  end

  create_table "earned_facts_slim", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "ppn_id"
    t.integer "field_key"
  end

  add_index "earned_facts_slim", ["field_key"], :name => "idx_efsfield_key"
  add_index "earned_facts_slim", ["ppn_id"], :name => "idx_efsppn_key"

  create_table "earned_facts_toofat", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "ppn_id"
    t.integer "game_key"
    t.integer "ern_3"
    t.integer "ern_2"
    t.integer "ern_1"
    t.integer "ern_b"
  end

  create_table "earned_facts_withdate", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "ppn_id"
    t.integer "field"
    t.integer "game_key"
    t.integer "bat_team_key"
    t.integer "field_team_key"
    t.integer "batter_key"
    t.integer "date_key"
  end

  add_index "earned_facts_withdate", ["batter_key", "game_key", "field"], :name => "idx_efwthreebee_key"
  add_index "earned_facts_withdate", ["batter_key", "game_key"], :name => "idx_efwbattergame_key"
  add_index "earned_facts_withdate", ["batter_key"], :name => "idx_efwbatter_key"
  add_index "earned_facts_withdate", ["date_key"], :name => "idx_efwdatekey_key"
  add_index "earned_facts_withdate", ["game_key"], :name => "idx_efwgame_key"
  add_index "earned_facts_withdate", ["ppn_id"], :name => "idx_efwppn_key"

  create_table "earned_hoody", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "ppn_id"
    t.integer "field"
    t.integer "game_key"
  end

  create_table "ells_bats_2013", :id => false, :force => true do |t|
    t.integer "game_key"
  end

  create_table "era_2010", :id => false, :force => true do |t|
    t.string  "team",      :limit => 3
    t.decimal "era"
    t.integer "lester_ab"
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

  add_index "fielder_dims", ["id"], :name => "idx_fielder_id"
  add_index "fielder_dims", ["id"], :name => "idx_id_fielder_dims"
  add_index "fielder_dims", ["pitcher_key", "catcher_key", "first_base_key", "second_base_key", "third_base_key", "shortstop_key", "left_field_key", "center_field_key", "right_field_key"], :name => "idx_fielder_nine"
  add_index "fielder_dims", ["pitcher_key"], :name => "idx_fd_pitcher_key"
  add_index "fielder_dims", ["pitcher_key"], :name => "idx_pitcher_key"

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

  create_table "fielder_dims_1", :id => false, :force => true do |t|
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

  create_table "fielder_dims_2", :id => false, :force => true do |t|
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

  create_table "fielder_dims_2014", :id => false, :force => true do |t|
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

  create_table "fielder_dims_3", :id => false, :force => true do |t|
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

  create_table "fielder_dims_4", :id => false, :force => true do |t|
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

  create_table "fielder_dims_5", :id => false, :force => true do |t|
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

  create_table "fielder_dims_6", :id => false, :force => true do |t|
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

  create_table "fielder_dims_7", :id => false, :force => true do |t|
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

  add_index "game_dims", ["game_id"], :name => "idx_game_id"

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

  create_table "hoff_one", :id => false, :force => true do |t|
    t.integer "id"
    t.string  "player_name"
    t.string  "yearo"
    t.integer "at_bat",      :limit => 8
    t.integer "hit",         :limit => 8
    t.integer "hbp",         :limit => 8
    t.integer "bag",         :limit => 8
    t.integer "sacfly",      :limit => 8
    t.integer "walk",        :limit => 8
    t.integer "outs",        :limit => 8
    t.integer "rbi",         :limit => 8
    t.integer "earned_runs", :limit => 8
  end

  create_table "hoff_two", :id => false, :force => true do |t|
    t.integer "id"
    t.string  "player_name"
    t.string  "yearo"
    t.integer "at_bat"
    t.integer "hit"
    t.integer "hbp"
    t.integer "bag"
    t.integer "sacfly"
    t.integer "walk"
    t.integer "outs"
    t.integer "rbi"
    t.integer "earned_runs", :limit => 8
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

  create_table "interim_crap", :id => false, :force => true do |t|
    t.integer "id"
    t.text    "datestring"
  end

  add_index "interim_crap", ["datestring"], :name => "idx_icrap_datestring_id"
  add_index "interim_crap", ["id"], :name => "idx_icrap_id"

  create_table "mbfc", :id => false, :force => true do |t|
    t.integer "decade"
    t.integer "game_key"
    t.integer "ppn_id"
    t.integer "ruby_id"
    t.integer "field_key"
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
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
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
    t.integer "sachit"
    t.integer "pa"
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

  add_index "play_facts", ["id"], :name => "idx_playfacts_ppnid_n"

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

  create_table "play_facts_1", :id => false, :force => true do |t|
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
    t.integer "sachit"
    t.integer "pa"
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

  create_table "play_facts_10", :id => false, :force => true do |t|
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
    t.integer "sachit"
    t.integer "pa"
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

  create_table "play_facts_11", :id => false, :force => true do |t|
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
    t.integer "sachit"
    t.integer "pa"
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

  create_table "play_facts_12062014", :id => false, :force => true do |t|
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
    t.integer "sachit"
    t.integer "pa"
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

  create_table "play_facts_2", :id => false, :force => true do |t|
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
    t.integer "sachit"
    t.integer "pa"
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

  create_table "play_facts_3", :id => false, :force => true do |t|
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
    t.integer "sachit"
    t.integer "pa"
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

  create_table "play_facts_4", :id => false, :force => true do |t|
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
    t.integer "sachit"
    t.integer "pa"
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

  create_table "play_facts_5", :id => false, :force => true do |t|
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
    t.integer "sachit"
    t.integer "pa"
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

  create_table "play_facts_6", :id => false, :force => true do |t|
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
    t.integer "sachit"
    t.integer "pa"
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

  create_table "play_facts_7", :id => false, :force => true do |t|
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
    t.integer "sachit"
    t.integer "pa"
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

  create_table "play_facts_7879", :id => false, :force => true do |t|
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
    t.integer "sachit"
    t.integer "pa"
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

  create_table "play_facts_8", :id => false, :force => true do |t|
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
    t.integer "sachit"
    t.integer "pa"
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

  create_table "play_facts_9", :id => false, :force => true do |t|
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
    t.integer "sachit"
    t.integer "pa"
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

  add_index "player_dims", ["id"], :name => "idx_player_dim_key"
  add_index "player_dims", ["player_id"], :name => "idx_player_dim_id"

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

  create_table "pootard", :id => false, :force => true do |t|
    t.string "batter"
  end

  create_table "righto", :id => false, :force => true do |t|
    t.integer "idio"
  end

  create_table "run_facts_fat", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "ppn_id"
    t.integer "batter_key"
    t.integer "run_3"
    t.integer "run_2"
    t.integer "run_1"
    t.integer "run_b"
  end

  add_index "run_facts_fat", ["batter_key"], :name => "idx_rffbatter_key"
  add_index "run_facts_fat", ["ppn_id"], :name => "idx_rffppnid_key"
  add_index "run_facts_fat", ["run_1"], :name => "idx_rffern1_key"
  add_index "run_facts_fat", ["run_2"], :name => "idx_rffern2_key"
  add_index "run_facts_fat", ["run_3"], :name => "idx_rffern3_key"
  add_index "run_facts_fat", ["run_b"], :name => "idx_rffernb_key"

  create_table "run_facts_slim", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "ppn_id"
    t.integer "field_key"
  end

  add_index "run_facts_slim", ["field_key"], :name => "idx_rfsfield_key"
  add_index "run_facts_slim", ["ppn_id"], :name => "idx_rfsppn_key"

  create_table "simon_saves", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "value"
    t.string  "term"
  end

  create_table "simons", :force => true do |t|
    t.integer "value"
    t.string  "term"
  end

  create_table "sourdough_save", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "player_key"
    t.text    "namo"
    t.date    "start_date"
    t.date    "end_date"
  end

  add_index "sourdough_save", ["id"], :name => "idx_sourdough_id_key"

  create_table "sourdough_save2", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "player_key"
    t.string  "namo"
    t.date    "start_date"
    t.date    "end_date"
    t.string  "namokey"
  end

  create_table "sourdoughs", :force => true do |t|
    t.integer "player_key"
    t.string  "namo"
    t.date    "start_year_full"
    t.date    "end_year_full"
    t.string  "namokey"
    t.integer "start_date"
    t.integer "end_date"
  end

  create_table "summer", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "summo"
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

  create_table "unearned_facts_fat", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "ppn_id"
    t.integer "batter_key"
    t.integer "ern_3"
    t.integer "ern_2"
    t.integer "ern_1"
    t.integer "ern_b"
  end

  add_index "unearned_facts_fat", ["batter_key"], :name => "idx_uffbatter_key"
  add_index "unearned_facts_fat", ["ern_1"], :name => "idx_uffern1_key"
  add_index "unearned_facts_fat", ["ern_2"], :name => "idx_uffern2_key"
  add_index "unearned_facts_fat", ["ern_3"], :name => "idx_uffern3_key"
  add_index "unearned_facts_fat", ["ern_b"], :name => "idx_uffernb_key"
  add_index "unearned_facts_fat", ["ppn_id"], :name => "idx_uffppnid_key"

  create_table "unearned_facts_slim", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "ppn_id"
    t.integer "field_key"
  end

  add_index "unearned_facts_slim", ["field_key"], :name => "idx_ufsfield_key"
  add_index "unearned_facts_slim", ["ppn_id"], :name => "idx_ufsppn_key"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "wrongo", :id => false, :force => true do |t|
    t.integer "idio"
  end

end
