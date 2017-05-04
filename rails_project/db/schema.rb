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

ActiveRecord::Schema.define(version: 20170503211255) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "constituencies", id: :string, force: :cascade do |t|
    t.integer  "pano"
    t.string   "name"
    t.string   "constituency_type"
    t.string   "county"
    t.string   "region_id"
    t.boolean  "abolished",         default: false
    t.date     "abolished_date"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["name"], name: "index_constituencies_on_name", using: :btree
    t.index ["pano"], name: "index_constituencies_on_pano", using: :btree
    t.index ["region_id"], name: "index_constituencies_on_region_id", using: :btree
  end

  create_table "constituency_election_candidate_votes", force: :cascade do |t|
    t.integer  "constituency_election_result_id"
    t.string   "party_id"
    t.string   "candidate_name"
    t.boolean  "candidate_incumbent"
    t.integer  "votes"
    t.float    "vote_share_percent"
    t.float    "percent_change_from_last_ge"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["candidate_name"], name: "index_constituency_election_candidate_votes_on_candidate_name", using: :btree
    t.index ["constituency_election_result_id"], name: "idx_const_electn_cand_votes_on_const_electn_rslt", using: :btree
    t.index ["party_id"], name: "idx_const_electn_cand_votes_on_parties", using: :btree
  end

  create_table "constituency_election_party_ranks", force: :cascade do |t|
    t.integer  "constituency_election_id"
    t.boolean  "prediction"
    t.string   "description"
    t.string   "party_1_id"
    t.integer  "party_1_votes"
    t.float    "party_1_vote_share_percent"
    t.integer  "party_1_votes_behind"
    t.float    "party_1_vote_share_percent_behind"
    t.string   "party_2_id"
    t.integer  "party_2_votes"
    t.float    "party_2_vote_share_percent"
    t.integer  "party_2_votes_behind"
    t.float    "party_2_vote_share_percent_behind"
    t.string   "party_3_id"
    t.integer  "party_3_votes"
    t.float    "party_3_vote_share_percent"
    t.integer  "party_3_votes_behind"
    t.float    "party_3_vote_share_percent_behind"
    t.string   "party_4_id"
    t.integer  "party_4_votes"
    t.float    "party_4_vote_share_percent"
    t.integer  "party_4_votes_behind"
    t.float    "party_4_vote_share_percent_behind"
    t.string   "party_5_id"
    t.integer  "party_5_votes"
    t.float    "party_5_vote_share_percent"
    t.integer  "party_5_votes_behind"
    t.float    "party_5_vote_share_percent_behind"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["constituency_election_id"], name: "idx_const_electn_pty_rnk_on_const_electn_id", using: :btree
    t.index ["description"], name: "index_constituency_election_party_ranks_on_description", using: :btree
    t.index ["party_1_vote_share_percent"], name: "idx_const_electn_pty_rnk_on_pty_1_vote_percent", using: :btree
    t.index ["party_1_vote_share_percent_behind"], name: "idx_const_electn_pty_rnk_on_pty_1_vote_percent_behind", using: :btree
    t.index ["party_1_votes"], name: "idx_const_electn_pty_rnk_on_pty_1_vote", using: :btree
    t.index ["party_1_votes_behind"], name: "idx_const_electn_pty_rnk_on_pty_1_vote_behind", using: :btree
    t.index ["party_2_vote_share_percent"], name: "idx_const_electn_pty_rnk_on_pty_2_vote_percent", using: :btree
    t.index ["party_2_vote_share_percent_behind"], name: "idx_const_electn_pty_rnk_on_pty_2_vote_percent_behind", using: :btree
    t.index ["party_2_votes"], name: "idx_const_electn_pty_rnk_on_pty_2_vote", using: :btree
    t.index ["party_2_votes_behind"], name: "idx_const_electn_pty_rnk_on_pty_2_vote_behind", using: :btree
    t.index ["party_3_vote_share_percent"], name: "idx_const_electn_pty_rnk_on_pty_3_vote_percent", using: :btree
    t.index ["party_3_vote_share_percent_behind"], name: "idx_const_electn_pty_rnk_on_pty_3_vote_percent_behind", using: :btree
    t.index ["party_3_votes"], name: "idx_const_electn_pty_rnk_on_pty_3_vote", using: :btree
    t.index ["party_3_votes_behind"], name: "idx_const_electn_pty_rnk_on_pty_3_vote_behind", using: :btree
    t.index ["party_4_vote_share_percent"], name: "idx_const_electn_pty_rnk_on_pty_4_vote_percent", using: :btree
    t.index ["party_4_vote_share_percent_behind"], name: "idx_const_electn_pty_rnk_on_pty_4_vote_percent_behind", using: :btree
    t.index ["party_4_votes"], name: "idx_const_electn_pty_rnk_on_pty_4_vote", using: :btree
    t.index ["party_4_votes_behind"], name: "idx_const_electn_pty_rnk_on_pty_4_vote_behind", using: :btree
    t.index ["party_5_vote_share_percent"], name: "idx_const_electn_pty_rnk_on_pty_5_vote_percent", using: :btree
    t.index ["party_5_vote_share_percent_behind"], name: "idx_const_electn_pty_rnk_on_pty_5_vote_percent_behind", using: :btree
    t.index ["party_5_votes"], name: "idx_const_electn_pty_rnk_on_pty_5_vote", using: :btree
    t.index ["party_5_votes_behind"], name: "idx_const_electn_pty_rnk_on_pty_5_vote_behind", using: :btree
    t.index ["prediction"], name: "index_constituency_election_party_ranks_on_prediction", using: :btree
  end

  create_table "constituency_election_predicted_votes", force: :cascade do |t|
    t.integer  "constituency_election_prediction_id"
    t.string   "party_id"
    t.float    "predicted_swing"
    t.float    "predicted_vote_share_percent"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["constituency_election_prediction_id", "party_id"], name: "idx_const_electn_prdctn_votes_on_const_electn_and_dscrptn", unique: true, using: :btree
    t.index ["constituency_election_prediction_id"], name: "idx_const_electn_predicted_votes_on_const_electn", using: :btree
    t.index ["party_id"], name: "idx_const_electn_predicted_votes_on_parties", using: :btree
  end

  create_table "constituency_election_predictions", force: :cascade do |t|
    t.integer  "constituency_election_id"
    t.string   "prediction_description"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["constituency_election_id", "prediction_description"], name: "idx_const_electn_prdctn_on_const_and_dscrptn", unique: true, using: :btree
    t.index ["constituency_election_id"], name: "idx_const_electn_prdctns_on_const_electn", using: :btree
  end

  create_table "constituency_election_results", force: :cascade do |t|
    t.integer  "constituency_election_id"
    t.string   "description"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["constituency_election_id"], name: "idx_const_electn_rslt_on_const_electn", unique: true, using: :btree
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
    t.index ["constituency_id", "election_type", "election_sub_type", "election_date"], name: "idx_const_electn_on_const_and_electn_type_and_date", unique: true, using: :btree
    t.index ["constituency_id"], name: "index_constituency_elections_on_constituency_id", using: :btree
    t.index ["election_date"], name: "index_constituency_elections_on_election_date", using: :btree
    t.index ["election_sub_type"], name: "index_constituency_elections_on_election_sub_type", using: :btree
    t.index ["election_type"], name: "index_constituency_elections_on_election_type", using: :btree
  end

  create_table "constituency_eu_votes", force: :cascade do |t|
    t.string   "constituency_id"
    t.float    "estimated_leave_vote_percent"
    t.float    "known_leave_vote_percent"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["constituency_id"], name: "index_constituency_eu_votes_on_constituency_id", using: :btree
  end

  create_table "constituency_population_estimates", force: :cascade do |t|
    t.string   "constituency_id"
    t.date     "estimate_date"
    t.string   "estimate_description"
    t.integer  "pop_total"
    t.integer  "pop_total_f"
    t.integer  "pop_total_m"
    t.integer  "pop_0_f"
    t.integer  "pop_0_m"
    t.integer  "pop_1_f"
    t.integer  "pop_1_m"
    t.integer  "pop_2_f"
    t.integer  "pop_2_m"
    t.integer  "pop_3_f"
    t.integer  "pop_3_m"
    t.integer  "pop_4_f"
    t.integer  "pop_4_m"
    t.integer  "pop_5_f"
    t.integer  "pop_5_m"
    t.integer  "pop_6_f"
    t.integer  "pop_6_m"
    t.integer  "pop_7_f"
    t.integer  "pop_7_m"
    t.integer  "pop_8_f"
    t.integer  "pop_8_m"
    t.integer  "pop_9_f"
    t.integer  "pop_9_m"
    t.integer  "pop_10_f"
    t.integer  "pop_10_m"
    t.integer  "pop_11_f"
    t.integer  "pop_11_m"
    t.integer  "pop_12_f"
    t.integer  "pop_12_m"
    t.integer  "pop_13_f"
    t.integer  "pop_13_m"
    t.integer  "pop_14_f"
    t.integer  "pop_14_m"
    t.integer  "pop_15_f"
    t.integer  "pop_15_m"
    t.integer  "pop_16_f"
    t.integer  "pop_16_m"
    t.integer  "pop_17_f"
    t.integer  "pop_17_m"
    t.integer  "pop_18_f"
    t.integer  "pop_18_m"
    t.integer  "pop_19_f"
    t.integer  "pop_19_m"
    t.integer  "pop_20_f"
    t.integer  "pop_20_m"
    t.integer  "pop_21_f"
    t.integer  "pop_21_m"
    t.integer  "pop_22_f"
    t.integer  "pop_22_m"
    t.integer  "pop_23_f"
    t.integer  "pop_23_m"
    t.integer  "pop_24_f"
    t.integer  "pop_24_m"
    t.integer  "pop_25_f"
    t.integer  "pop_25_m"
    t.integer  "pop_26_f"
    t.integer  "pop_26_m"
    t.integer  "pop_27_f"
    t.integer  "pop_27_m"
    t.integer  "pop_28_f"
    t.integer  "pop_28_m"
    t.integer  "pop_29_f"
    t.integer  "pop_29_m"
    t.integer  "pop_30_f"
    t.integer  "pop_30_m"
    t.integer  "pop_31_f"
    t.integer  "pop_31_m"
    t.integer  "pop_32_f"
    t.integer  "pop_32_m"
    t.integer  "pop_33_f"
    t.integer  "pop_33_m"
    t.integer  "pop_34_f"
    t.integer  "pop_34_m"
    t.integer  "pop_35_f"
    t.integer  "pop_35_m"
    t.integer  "pop_36_f"
    t.integer  "pop_36_m"
    t.integer  "pop_37_f"
    t.integer  "pop_37_m"
    t.integer  "pop_38_f"
    t.integer  "pop_38_m"
    t.integer  "pop_39_f"
    t.integer  "pop_39_m"
    t.integer  "pop_40_f"
    t.integer  "pop_40_m"
    t.integer  "pop_41_f"
    t.integer  "pop_41_m"
    t.integer  "pop_42_f"
    t.integer  "pop_42_m"
    t.integer  "pop_43_f"
    t.integer  "pop_43_m"
    t.integer  "pop_44_f"
    t.integer  "pop_44_m"
    t.integer  "pop_45_f"
    t.integer  "pop_45_m"
    t.integer  "pop_46_f"
    t.integer  "pop_46_m"
    t.integer  "pop_47_f"
    t.integer  "pop_47_m"
    t.integer  "pop_48_f"
    t.integer  "pop_48_m"
    t.integer  "pop_49_f"
    t.integer  "pop_49_m"
    t.integer  "pop_50_f"
    t.integer  "pop_50_m"
    t.integer  "pop_51_f"
    t.integer  "pop_51_m"
    t.integer  "pop_52_f"
    t.integer  "pop_52_m"
    t.integer  "pop_53_f"
    t.integer  "pop_53_m"
    t.integer  "pop_54_f"
    t.integer  "pop_54_m"
    t.integer  "pop_55_f"
    t.integer  "pop_55_m"
    t.integer  "pop_56_f"
    t.integer  "pop_56_m"
    t.integer  "pop_57_f"
    t.integer  "pop_57_m"
    t.integer  "pop_58_f"
    t.integer  "pop_58_m"
    t.integer  "pop_59_f"
    t.integer  "pop_59_m"
    t.integer  "pop_60_f"
    t.integer  "pop_60_m"
    t.integer  "pop_61_f"
    t.integer  "pop_61_m"
    t.integer  "pop_62_f"
    t.integer  "pop_62_m"
    t.integer  "pop_63_f"
    t.integer  "pop_63_m"
    t.integer  "pop_64_f"
    t.integer  "pop_64_m"
    t.integer  "pop_65_f"
    t.integer  "pop_65_m"
    t.integer  "pop_66_f"
    t.integer  "pop_66_m"
    t.integer  "pop_67_f"
    t.integer  "pop_67_m"
    t.integer  "pop_68_f"
    t.integer  "pop_68_m"
    t.integer  "pop_69_f"
    t.integer  "pop_69_m"
    t.integer  "pop_70_f"
    t.integer  "pop_70_m"
    t.integer  "pop_71_f"
    t.integer  "pop_71_m"
    t.integer  "pop_72_f"
    t.integer  "pop_72_m"
    t.integer  "pop_73_f"
    t.integer  "pop_73_m"
    t.integer  "pop_74_f"
    t.integer  "pop_74_m"
    t.integer  "pop_75_f"
    t.integer  "pop_75_m"
    t.integer  "pop_76_f"
    t.integer  "pop_76_m"
    t.integer  "pop_77_f"
    t.integer  "pop_77_m"
    t.integer  "pop_78_f"
    t.integer  "pop_78_m"
    t.integer  "pop_79_f"
    t.integer  "pop_79_m"
    t.integer  "pop_80_f"
    t.integer  "pop_80_m"
    t.integer  "pop_81_f"
    t.integer  "pop_81_m"
    t.integer  "pop_82_f"
    t.integer  "pop_82_m"
    t.integer  "pop_83_f"
    t.integer  "pop_83_m"
    t.integer  "pop_84_f"
    t.integer  "pop_84_m"
    t.integer  "pop_85_f"
    t.integer  "pop_85_m"
    t.integer  "pop_86_f"
    t.integer  "pop_86_m"
    t.integer  "pop_87_f"
    t.integer  "pop_87_m"
    t.integer  "pop_88_f"
    t.integer  "pop_88_m"
    t.integer  "pop_89_f"
    t.integer  "pop_89_m"
    t.integer  "pop_90plus_f"
    t.integer  "pop_90plus_m"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["constituency_id"], name: "index_constituency_population_estimates_on_constituency_id", using: :btree
    t.index ["estimate_date"], name: "index_constituency_population_estimates_on_estimate_date", using: :btree
    t.index ["estimate_description"], name: "index_constituency_population_estimates_on_estimate_description", using: :btree
  end

  create_table "constituency_wards", id: false, force: :cascade do |t|
    t.string   "constituency_id"
    t.string   "ward_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["constituency_id", "ward_id"], name: "idx_const_wards_on_const_and_ward", unique: true, using: :btree
    t.index ["constituency_id"], name: "index_constituency_wards_on_constituency_id", using: :btree
    t.index ["ward_id"], name: "index_constituency_wards_on_ward_id", using: :btree
  end

  create_table "countries", id: :string, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "country_population_estimates", force: :cascade do |t|
    t.string   "country_id"
    t.date     "estimate_date"
    t.string   "estimate_description"
    t.integer  "pop_total"
    t.integer  "pop_total_f"
    t.integer  "pop_total_m"
    t.integer  "pop_0_f"
    t.integer  "pop_0_m"
    t.integer  "pop_1_f"
    t.integer  "pop_1_m"
    t.integer  "pop_2_f"
    t.integer  "pop_2_m"
    t.integer  "pop_3_f"
    t.integer  "pop_3_m"
    t.integer  "pop_4_f"
    t.integer  "pop_4_m"
    t.integer  "pop_5_f"
    t.integer  "pop_5_m"
    t.integer  "pop_6_f"
    t.integer  "pop_6_m"
    t.integer  "pop_7_f"
    t.integer  "pop_7_m"
    t.integer  "pop_8_f"
    t.integer  "pop_8_m"
    t.integer  "pop_9_f"
    t.integer  "pop_9_m"
    t.integer  "pop_10_f"
    t.integer  "pop_10_m"
    t.integer  "pop_11_f"
    t.integer  "pop_11_m"
    t.integer  "pop_12_f"
    t.integer  "pop_12_m"
    t.integer  "pop_13_f"
    t.integer  "pop_13_m"
    t.integer  "pop_14_f"
    t.integer  "pop_14_m"
    t.integer  "pop_15_f"
    t.integer  "pop_15_m"
    t.integer  "pop_16_f"
    t.integer  "pop_16_m"
    t.integer  "pop_17_f"
    t.integer  "pop_17_m"
    t.integer  "pop_18_f"
    t.integer  "pop_18_m"
    t.integer  "pop_19_f"
    t.integer  "pop_19_m"
    t.integer  "pop_20_f"
    t.integer  "pop_20_m"
    t.integer  "pop_21_f"
    t.integer  "pop_21_m"
    t.integer  "pop_22_f"
    t.integer  "pop_22_m"
    t.integer  "pop_23_f"
    t.integer  "pop_23_m"
    t.integer  "pop_24_f"
    t.integer  "pop_24_m"
    t.integer  "pop_25_f"
    t.integer  "pop_25_m"
    t.integer  "pop_26_f"
    t.integer  "pop_26_m"
    t.integer  "pop_27_f"
    t.integer  "pop_27_m"
    t.integer  "pop_28_f"
    t.integer  "pop_28_m"
    t.integer  "pop_29_f"
    t.integer  "pop_29_m"
    t.integer  "pop_30_f"
    t.integer  "pop_30_m"
    t.integer  "pop_31_f"
    t.integer  "pop_31_m"
    t.integer  "pop_32_f"
    t.integer  "pop_32_m"
    t.integer  "pop_33_f"
    t.integer  "pop_33_m"
    t.integer  "pop_34_f"
    t.integer  "pop_34_m"
    t.integer  "pop_35_f"
    t.integer  "pop_35_m"
    t.integer  "pop_36_f"
    t.integer  "pop_36_m"
    t.integer  "pop_37_f"
    t.integer  "pop_37_m"
    t.integer  "pop_38_f"
    t.integer  "pop_38_m"
    t.integer  "pop_39_f"
    t.integer  "pop_39_m"
    t.integer  "pop_40_f"
    t.integer  "pop_40_m"
    t.integer  "pop_41_f"
    t.integer  "pop_41_m"
    t.integer  "pop_42_f"
    t.integer  "pop_42_m"
    t.integer  "pop_43_f"
    t.integer  "pop_43_m"
    t.integer  "pop_44_f"
    t.integer  "pop_44_m"
    t.integer  "pop_45_f"
    t.integer  "pop_45_m"
    t.integer  "pop_46_f"
    t.integer  "pop_46_m"
    t.integer  "pop_47_f"
    t.integer  "pop_47_m"
    t.integer  "pop_48_f"
    t.integer  "pop_48_m"
    t.integer  "pop_49_f"
    t.integer  "pop_49_m"
    t.integer  "pop_50_f"
    t.integer  "pop_50_m"
    t.integer  "pop_51_f"
    t.integer  "pop_51_m"
    t.integer  "pop_52_f"
    t.integer  "pop_52_m"
    t.integer  "pop_53_f"
    t.integer  "pop_53_m"
    t.integer  "pop_54_f"
    t.integer  "pop_54_m"
    t.integer  "pop_55_f"
    t.integer  "pop_55_m"
    t.integer  "pop_56_f"
    t.integer  "pop_56_m"
    t.integer  "pop_57_f"
    t.integer  "pop_57_m"
    t.integer  "pop_58_f"
    t.integer  "pop_58_m"
    t.integer  "pop_59_f"
    t.integer  "pop_59_m"
    t.integer  "pop_60_f"
    t.integer  "pop_60_m"
    t.integer  "pop_61_f"
    t.integer  "pop_61_m"
    t.integer  "pop_62_f"
    t.integer  "pop_62_m"
    t.integer  "pop_63_f"
    t.integer  "pop_63_m"
    t.integer  "pop_64_f"
    t.integer  "pop_64_m"
    t.integer  "pop_65_f"
    t.integer  "pop_65_m"
    t.integer  "pop_66_f"
    t.integer  "pop_66_m"
    t.integer  "pop_67_f"
    t.integer  "pop_67_m"
    t.integer  "pop_68_f"
    t.integer  "pop_68_m"
    t.integer  "pop_69_f"
    t.integer  "pop_69_m"
    t.integer  "pop_70_f"
    t.integer  "pop_70_m"
    t.integer  "pop_71_f"
    t.integer  "pop_71_m"
    t.integer  "pop_72_f"
    t.integer  "pop_72_m"
    t.integer  "pop_73_f"
    t.integer  "pop_73_m"
    t.integer  "pop_74_f"
    t.integer  "pop_74_m"
    t.integer  "pop_75_f"
    t.integer  "pop_75_m"
    t.integer  "pop_76_f"
    t.integer  "pop_76_m"
    t.integer  "pop_77_f"
    t.integer  "pop_77_m"
    t.integer  "pop_78_f"
    t.integer  "pop_78_m"
    t.integer  "pop_79_f"
    t.integer  "pop_79_m"
    t.integer  "pop_80_f"
    t.integer  "pop_80_m"
    t.integer  "pop_81_f"
    t.integer  "pop_81_m"
    t.integer  "pop_82_f"
    t.integer  "pop_82_m"
    t.integer  "pop_83_f"
    t.integer  "pop_83_m"
    t.integer  "pop_84_f"
    t.integer  "pop_84_m"
    t.integer  "pop_85_f"
    t.integer  "pop_85_m"
    t.integer  "pop_86_f"
    t.integer  "pop_86_m"
    t.integer  "pop_87_f"
    t.integer  "pop_87_m"
    t.integer  "pop_88_f"
    t.integer  "pop_88_m"
    t.integer  "pop_89_f"
    t.integer  "pop_89_m"
    t.integer  "pop_90plus_f"
    t.integer  "pop_90plus_m"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["country_id"], name: "index_country_population_estimates_on_country_id", using: :btree
    t.index ["estimate_date"], name: "index_country_population_estimates_on_estimate_date", using: :btree
    t.index ["estimate_description"], name: "index_country_population_estimates_on_estimate_description", using: :btree
  end

  create_table "local_authorities", id: :string, force: :cascade do |t|
    t.string   "name"
    t.boolean  "abolished",      default: false
    t.date     "abolished_date"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["name"], name: "index_local_authorities_on_name", using: :btree
  end

  create_table "parties", id: :string, force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_parties_on_name", unique: true, using: :btree
  end

  create_table "regions", id: :string, force: :cascade do |t|
    t.string   "name"
    t.string   "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_regions_on_country_id", using: :btree
    t.index ["name"], name: "index_regions_on_name", using: :btree
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

  create_table "ward_population_estimates", force: :cascade do |t|
    t.string   "ward_id"
    t.date     "estimate_date"
    t.string   "estimate_description"
    t.integer  "pop_total"
    t.integer  "pop_total_f"
    t.integer  "pop_total_m"
    t.integer  "pop_0_f"
    t.integer  "pop_0_m"
    t.integer  "pop_1_f"
    t.integer  "pop_1_m"
    t.integer  "pop_2_f"
    t.integer  "pop_2_m"
    t.integer  "pop_3_f"
    t.integer  "pop_3_m"
    t.integer  "pop_4_f"
    t.integer  "pop_4_m"
    t.integer  "pop_5_f"
    t.integer  "pop_5_m"
    t.integer  "pop_6_f"
    t.integer  "pop_6_m"
    t.integer  "pop_7_f"
    t.integer  "pop_7_m"
    t.integer  "pop_8_f"
    t.integer  "pop_8_m"
    t.integer  "pop_9_f"
    t.integer  "pop_9_m"
    t.integer  "pop_10_f"
    t.integer  "pop_10_m"
    t.integer  "pop_11_f"
    t.integer  "pop_11_m"
    t.integer  "pop_12_f"
    t.integer  "pop_12_m"
    t.integer  "pop_13_f"
    t.integer  "pop_13_m"
    t.integer  "pop_14_f"
    t.integer  "pop_14_m"
    t.integer  "pop_15_f"
    t.integer  "pop_15_m"
    t.integer  "pop_16_f"
    t.integer  "pop_16_m"
    t.integer  "pop_17_f"
    t.integer  "pop_17_m"
    t.integer  "pop_18_f"
    t.integer  "pop_18_m"
    t.integer  "pop_19_f"
    t.integer  "pop_19_m"
    t.integer  "pop_20_f"
    t.integer  "pop_20_m"
    t.integer  "pop_21_f"
    t.integer  "pop_21_m"
    t.integer  "pop_22_f"
    t.integer  "pop_22_m"
    t.integer  "pop_23_f"
    t.integer  "pop_23_m"
    t.integer  "pop_24_f"
    t.integer  "pop_24_m"
    t.integer  "pop_25_f"
    t.integer  "pop_25_m"
    t.integer  "pop_26_f"
    t.integer  "pop_26_m"
    t.integer  "pop_27_f"
    t.integer  "pop_27_m"
    t.integer  "pop_28_f"
    t.integer  "pop_28_m"
    t.integer  "pop_29_f"
    t.integer  "pop_29_m"
    t.integer  "pop_30_f"
    t.integer  "pop_30_m"
    t.integer  "pop_31_f"
    t.integer  "pop_31_m"
    t.integer  "pop_32_f"
    t.integer  "pop_32_m"
    t.integer  "pop_33_f"
    t.integer  "pop_33_m"
    t.integer  "pop_34_f"
    t.integer  "pop_34_m"
    t.integer  "pop_35_f"
    t.integer  "pop_35_m"
    t.integer  "pop_36_f"
    t.integer  "pop_36_m"
    t.integer  "pop_37_f"
    t.integer  "pop_37_m"
    t.integer  "pop_38_f"
    t.integer  "pop_38_m"
    t.integer  "pop_39_f"
    t.integer  "pop_39_m"
    t.integer  "pop_40_f"
    t.integer  "pop_40_m"
    t.integer  "pop_41_f"
    t.integer  "pop_41_m"
    t.integer  "pop_42_f"
    t.integer  "pop_42_m"
    t.integer  "pop_43_f"
    t.integer  "pop_43_m"
    t.integer  "pop_44_f"
    t.integer  "pop_44_m"
    t.integer  "pop_45_f"
    t.integer  "pop_45_m"
    t.integer  "pop_46_f"
    t.integer  "pop_46_m"
    t.integer  "pop_47_f"
    t.integer  "pop_47_m"
    t.integer  "pop_48_f"
    t.integer  "pop_48_m"
    t.integer  "pop_49_f"
    t.integer  "pop_49_m"
    t.integer  "pop_50_f"
    t.integer  "pop_50_m"
    t.integer  "pop_51_f"
    t.integer  "pop_51_m"
    t.integer  "pop_52_f"
    t.integer  "pop_52_m"
    t.integer  "pop_53_f"
    t.integer  "pop_53_m"
    t.integer  "pop_54_f"
    t.integer  "pop_54_m"
    t.integer  "pop_55_f"
    t.integer  "pop_55_m"
    t.integer  "pop_56_f"
    t.integer  "pop_56_m"
    t.integer  "pop_57_f"
    t.integer  "pop_57_m"
    t.integer  "pop_58_f"
    t.integer  "pop_58_m"
    t.integer  "pop_59_f"
    t.integer  "pop_59_m"
    t.integer  "pop_60_f"
    t.integer  "pop_60_m"
    t.integer  "pop_61_f"
    t.integer  "pop_61_m"
    t.integer  "pop_62_f"
    t.integer  "pop_62_m"
    t.integer  "pop_63_f"
    t.integer  "pop_63_m"
    t.integer  "pop_64_f"
    t.integer  "pop_64_m"
    t.integer  "pop_65_f"
    t.integer  "pop_65_m"
    t.integer  "pop_66_f"
    t.integer  "pop_66_m"
    t.integer  "pop_67_f"
    t.integer  "pop_67_m"
    t.integer  "pop_68_f"
    t.integer  "pop_68_m"
    t.integer  "pop_69_f"
    t.integer  "pop_69_m"
    t.integer  "pop_70_f"
    t.integer  "pop_70_m"
    t.integer  "pop_71_f"
    t.integer  "pop_71_m"
    t.integer  "pop_72_f"
    t.integer  "pop_72_m"
    t.integer  "pop_73_f"
    t.integer  "pop_73_m"
    t.integer  "pop_74_f"
    t.integer  "pop_74_m"
    t.integer  "pop_75_f"
    t.integer  "pop_75_m"
    t.integer  "pop_76_f"
    t.integer  "pop_76_m"
    t.integer  "pop_77_f"
    t.integer  "pop_77_m"
    t.integer  "pop_78_f"
    t.integer  "pop_78_m"
    t.integer  "pop_79_f"
    t.integer  "pop_79_m"
    t.integer  "pop_80_f"
    t.integer  "pop_80_m"
    t.integer  "pop_81_f"
    t.integer  "pop_81_m"
    t.integer  "pop_82_f"
    t.integer  "pop_82_m"
    t.integer  "pop_83_f"
    t.integer  "pop_83_m"
    t.integer  "pop_84_f"
    t.integer  "pop_84_m"
    t.integer  "pop_85_f"
    t.integer  "pop_85_m"
    t.integer  "pop_86_f"
    t.integer  "pop_86_m"
    t.integer  "pop_87_f"
    t.integer  "pop_87_m"
    t.integer  "pop_88_f"
    t.integer  "pop_88_m"
    t.integer  "pop_89_f"
    t.integer  "pop_89_m"
    t.integer  "pop_90plus_f"
    t.integer  "pop_90plus_m"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["estimate_date"], name: "index_ward_population_estimates_on_estimate_date", using: :btree
    t.index ["estimate_description"], name: "index_ward_population_estimates_on_estimate_description", using: :btree
    t.index ["ward_id"], name: "index_ward_population_estimates_on_ward_id", using: :btree
  end

  create_table "wards", id: :string, force: :cascade do |t|
    t.string   "name"
    t.string   "local_authority_id"
    t.boolean  "abolished",          default: false
    t.date     "abolished_date"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["local_authority_id"], name: "index_wards_on_local_authority_id", using: :btree
    t.index ["name"], name: "index_wards_on_name", using: :btree
  end

  add_foreign_key "constituencies", "regions"
  add_foreign_key "constituency_election_candidate_votes", "constituency_election_results"
  add_foreign_key "constituency_election_candidate_votes", "parties"
  add_foreign_key "constituency_election_party_ranks", "constituency_elections"
  add_foreign_key "constituency_election_party_ranks", "parties", column: "party_1_id"
  add_foreign_key "constituency_election_party_ranks", "parties", column: "party_2_id"
  add_foreign_key "constituency_election_party_ranks", "parties", column: "party_3_id"
  add_foreign_key "constituency_election_party_ranks", "parties", column: "party_4_id"
  add_foreign_key "constituency_election_party_ranks", "parties", column: "party_5_id"
  add_foreign_key "constituency_election_predicted_votes", "constituency_election_predictions"
  add_foreign_key "constituency_election_predicted_votes", "parties"
  add_foreign_key "constituency_election_predictions", "constituency_elections"
  add_foreign_key "constituency_election_results", "constituency_elections"
  add_foreign_key "constituency_elections", "constituencies"
  add_foreign_key "constituency_eu_votes", "constituencies"
  add_foreign_key "constituency_population_estimates", "constituencies"
  add_foreign_key "constituency_wards", "constituencies"
  add_foreign_key "constituency_wards", "wards"
  add_foreign_key "country_population_estimates", "countries"
  add_foreign_key "regions", "countries"
  add_foreign_key "ward_eu_votes", "wards"
  add_foreign_key "ward_population_estimates", "wards"
  add_foreign_key "wards", "local_authorities"
end
