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

ActiveRecord::Schema.define(version: 20170424222901) do

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
    t.integer  "votes"
    t.float    "vote_share_percent"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["constituency_election_id"], name: "idx_const_electn_cand_votes_on_const_electn", using: :btree
    t.index ["party_id"], name: "idx_const_electn_cand_votes_on_parties", using: :btree
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

  create_table "constituency_eu_leave_votes", force: :cascade do |t|
    t.string   "constituency_id"
    t.float    "estimated_leave_vote_percent"
    t.float    "known_leave_vote_percent"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["constituency_id"], name: "index_constituency_eu_leave_votes_on_constituency_id", using: :btree
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

  add_foreign_key "constituencies", "regions"
  add_foreign_key "constituency_election_candidate_votes", "constituency_elections"
  add_foreign_key "constituency_election_candidate_votes", "parties"
  add_foreign_key "constituency_elections", "constituencies"
  add_foreign_key "constituency_eu_leave_votes", "constituencies"
end
