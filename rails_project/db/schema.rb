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

ActiveRecord::Schema.define(version: 20170427233255) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "constituencies", id: :string, force: :cascade do |t|
    t.integer  "pano"
    t.string   "name"
    t.string   "constituency_type"
    t.string   "county"
    t.string   "region_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["region_id"], name: "index_constituencies_on_region_id", using: :btree
  end

  create_table "constituency_election_candidate_votes", force: :cascade do |t|
    t.integer  "constituency_election_id"
    t.string   "party_id"
    t.string   "candidate_name"
    t.boolean  "candidate_incumbent"
    t.integer  "votes"
    t.float    "vote_share_percent"
    t.float    "percent_change_from_last_ge"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["constituency_election_id"], name: "idx_const_electn_cand_votes_on_const_electn", using: :btree
    t.index ["party_id"], name: "idx_const_electn_cand_votes_on_parties", using: :btree
  end

  create_table "constituency_election_predictions", force: :cascade do |t|
    t.integer  "constituency_election_id"
    t.string   "prediction_description"
    t.string   "party_id"
    t.float    "predicted_swing"
    t.float    "predicted_vote_share_percent"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["constituency_election_id"], name: "idx_const_electn_predictions_on_const_electn", using: :btree
    t.index ["party_id"], name: "idx_const_electn_predictions_on_parties", using: :btree
  end

  create_table "constituency_elections", force: :cascade do |t|
    t.string   "constituency_id"
    t.string   "election_type"
    t.string   "election_sub_type"
    t.date     "election_date"
    t.integer  "electorate_size"
    t.integer  "total_valid_votes_counted"
    t.integer  "postal_votes_issued"
    t.integer  "valid_postal_votes_counted"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["constituency_id"], name: "index_constituency_elections_on_constituency_id", using: :btree
  end

  create_table "constituency_eu_votes", force: :cascade do |t|
    t.string   "constituency_id"
    t.float    "estimated_leave_vote_percent"
    t.float    "known_leave_vote_percent"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["constituency_id"], name: "index_constituency_eu_votes_on_constituency_id", using: :btree
  end

  create_table "constituency_wards", id: false, force: :cascade do |t|
    t.string "constituency_id"
    t.string "ward_id"
    t.index ["constituency_id", "ward_id"], name: "index_constituency_wards_on_constituency_id_and_ward_id", using: :btree
    t.index ["constituency_id"], name: "index_constituency_wards_on_constituency_id", using: :btree
    t.index ["ward_id"], name: "index_constituency_wards_on_ward_id", using: :btree
  end

  create_table "local_authorities", id: :string, force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parties", id: :string, force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", id: :string, force: :cascade do |t|
    t.string   "name"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ward_eu_votes", force: :cascade do |t|
    t.string   "ward_id"
    t.integer  "known_leave_votes"
    t.integer  "known_remain_votes"
    t.float    "known_leave_vote_percent"
    t.float    "known_remain_vote_percent"
    t.boolean  "contains_postal_votes"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["ward_id"], name: "index_ward_eu_votes_on_ward_id", using: :btree
  end

  create_table "wards", id: :string, force: :cascade do |t|
    t.string   "name"
    t.string   "local_authority_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["local_authority_id"], name: "index_wards_on_local_authority_id", using: :btree
  end

  add_foreign_key "constituencies", "regions"
  add_foreign_key "constituency_election_candidate_votes", "constituency_elections"
  add_foreign_key "constituency_election_candidate_votes", "parties"
  add_foreign_key "constituency_election_predictions", "constituency_elections"
  add_foreign_key "constituency_election_predictions", "parties"
  add_foreign_key "constituency_elections", "constituencies"
  add_foreign_key "constituency_eu_votes", "constituencies"
  add_foreign_key "constituency_wards", "constituencies"
  add_foreign_key "constituency_wards", "wards"
  add_foreign_key "ward_eu_votes", "wards"
  add_foreign_key "wards", "local_authorities"
end
