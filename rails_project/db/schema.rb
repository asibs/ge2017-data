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

ActiveRecord::Schema.define(version: 20170510180144) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "area_eu_votes", force: :cascade do |t|
    t.string   "area_type"
    t.string   "area_id"
    t.boolean  "contains_postal_votes"
    t.integer  "actual_leave_votes"
    t.integer  "actual_remain_votes"
    t.float    "actual_leave_vote_percent"
    t.float    "estimated_leave_vote_percent"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["area_type", "area_id"], name: "idx_area_eu_vote_on_area", using: :btree
  end

  create_table "area_incapacity_benefits", force: :cascade do |t|
    t.string   "area_type"
    t.string   "area_id"
    t.date     "statistic_date"
    t.integer  "incapacity_benefits_count"
    t.integer  "incapacity_benefits_percent"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["area_type", "area_id"], name: "idx_area_incap_benefits_on_area", using: :btree
    t.index ["statistic_date"], name: "idx_area_incap_benefits_on_stat_date", using: :btree
  end

  create_table "area_median_wages", force: :cascade do |t|
    t.string   "area_type"
    t.string   "area_id"
    t.date     "statistic_date"
    t.integer  "median_wage"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["area_type", "area_id"], name: "idx_area_median_wage_on_area", using: :btree
    t.index ["statistic_date"], name: "idx_area_median_wage_on_stat_date", using: :btree
  end

  create_table "area_out_of_work_benefits", force: :cascade do |t|
    t.string   "area_type"
    t.string   "area_id"
    t.date     "statistic_date"
    t.integer  "oow_benefits_count"
    t.float    "oow_benefits_percent"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["area_type", "area_id"], name: "idx_area_oow_benefits_on_area", using: :btree
    t.index ["statistic_date"], name: "idx_area_oow_benefits_on_stat_date", using: :btree
  end

  create_table "area_population_estimates", force: :cascade do |t|
    t.string   "area_type"
    t.string   "area_id"
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
    t.index ["area_type", "area_id"], name: "idx_area_pop_est_on_area", using: :btree
    t.index ["estimate_date"], name: "index_area_population_estimates_on_estimate_date", using: :btree
    t.index ["estimate_description"], name: "index_area_population_estimates_on_estimate_description", using: :btree
  end

  create_table "area_summaries", force: :cascade do |t|
    t.string   "area_type"
    t.string   "area_id"
    t.string   "area_name"
    t.float    "eu_ref_leave_vote_percent"
    t.date     "pop_estimate_date"
    t.integer  "pop_total"
    t.integer  "pop_total_f"
    t.float    "pop_total_f_percent"
    t.float    "pop_total_f_diff_avg"
    t.integer  "pop_total_m"
    t.float    "pop_total_m_percent"
    t.float    "pop_total_m_diff_avg"
    t.integer  "pop_0_17"
    t.float    "pop_0_17_percent"
    t.float    "pop_0_17_diff_avg"
    t.integer  "pop_18_34"
    t.float    "pop_18_34_percent"
    t.float    "pop_18_34_diff_avg"
    t.integer  "pop_35_49"
    t.float    "pop_35_49_percent"
    t.float    "pop_35_49_diff_avg"
    t.integer  "pop_50_64"
    t.float    "pop_50_64_percent"
    t.float    "pop_50_64_diff_avg"
    t.integer  "pop_65_plus"
    t.float    "pop_65_plus_percent"
    t.float    "pop_65_plus_diff_avg"
    t.date     "unemployment_date"
    t.integer  "unemployment_count"
    t.float    "unemployemnt_percent"
    t.float    "unemployemnt_diff_avg"
    t.date     "youth_unemployment_date"
    t.integer  "youth_unemployment_count"
    t.float    "youth_unemployemnt_percent"
    t.float    "youth_unemployemnt_diff_avg"
    t.date     "oow_benefits_date"
    t.integer  "oow_benefits_count"
    t.float    "oow_benefits_percent"
    t.float    "oow_benefits_diff_avg"
    t.date     "incapacity_benefits_date"
    t.integer  "incapacity_benefits_count"
    t.float    "incapacity_benefits_percent"
    t.float    "incapacity_benefits_diff_avg"
    t.date     "median_wage_date"
    t.integer  "median_wage"
    t.integer  "median_wage_diff_avg"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["area_type", "area_id"], name: "idx_area_summary_on_area", unique: true, using: :btree
    t.index ["incapacity_benefits_count"], name: "idx_area_summary_on_incapacity_benefit_cnt", using: :btree
    t.index ["incapacity_benefits_diff_avg"], name: "idx_area_summary_on_incapacity_benefit_diff_avg", using: :btree
    t.index ["incapacity_benefits_percent"], name: "idx_area_summary_on_incapacity_benefit_pct", using: :btree
    t.index ["median_wage"], name: "idx_area_summary_on_median_wage", using: :btree
    t.index ["median_wage_diff_avg"], name: "idx_area_summary_on_median_wage_diff_avg", using: :btree
    t.index ["oow_benefits_count"], name: "idx_area_summary_on_oow_benefit_cnt", using: :btree
    t.index ["oow_benefits_diff_avg"], name: "idx_area_summary_on_oow_benefit_diff_avg", using: :btree
    t.index ["oow_benefits_percent"], name: "idx_area_summary_on_oow_benefit_pct", using: :btree
    t.index ["pop_0_17"], name: "idx_area_summary_on_pop_0_17", using: :btree
    t.index ["pop_0_17_diff_avg"], name: "idx_area_summary_on_pop_0_17_diff_avg", using: :btree
    t.index ["pop_0_17_percent"], name: "idx_area_summary_on_pop_0_17_pct", using: :btree
    t.index ["pop_18_34"], name: "idx_area_summary_on_pop_18_34", using: :btree
    t.index ["pop_18_34_diff_avg"], name: "idx_area_summary_on_pop_18_34_diff_avg", using: :btree
    t.index ["pop_18_34_percent"], name: "idx_area_summary_on_pop_18_34_pct", using: :btree
    t.index ["pop_35_49"], name: "idx_area_summary_on_pop_35_49", using: :btree
    t.index ["pop_35_49_diff_avg"], name: "idx_area_summary_on_pop_35_49_diff_avg", using: :btree
    t.index ["pop_35_49_percent"], name: "idx_area_summary_on_pop_35_49_pct", using: :btree
    t.index ["pop_50_64"], name: "idx_area_summary_on_pop_50_64", using: :btree
    t.index ["pop_50_64_diff_avg"], name: "idx_area_summary_on_pop_50_64_diff_avg", using: :btree
    t.index ["pop_50_64_percent"], name: "idx_area_summary_on_pop_50_64_pct", using: :btree
    t.index ["pop_65_plus"], name: "idx_area_summary_on_pop_65_plus", using: :btree
    t.index ["pop_65_plus_diff_avg"], name: "idx_area_summary_on_pop_65_plus_diff_avg", using: :btree
    t.index ["pop_65_plus_percent"], name: "idx_area_summary_on_pop_65_plus_pct", using: :btree
    t.index ["pop_total"], name: "idx_area_summary_on_pop_total", using: :btree
    t.index ["pop_total_f"], name: "idx_area_summary_on_pop_total_f", using: :btree
    t.index ["pop_total_f_diff_avg"], name: "idx_area_summary_on_pop_total_f_diff_avg", using: :btree
    t.index ["pop_total_f_percent"], name: "idx_area_summary_on_pop_total_f_pct", using: :btree
    t.index ["pop_total_m"], name: "idx_area_summary_on_pop_total_m", using: :btree
    t.index ["pop_total_m_diff_avg"], name: "idx_area_summary_on_pop_total_m_diff_avg", using: :btree
    t.index ["pop_total_m_percent"], name: "idx_area_summary_on_pop_total_m_pct", using: :btree
    t.index ["unemployemnt_diff_avg"], name: "idx_area_summary_on_umemployment_diff_avg", using: :btree
    t.index ["unemployemnt_percent"], name: "idx_area_summary_on_umemployment_pct", using: :btree
    t.index ["unemployment_count"], name: "idx_area_summary_on_umemployment_cnt", using: :btree
    t.index ["youth_unemployemnt_diff_avg"], name: "idx_area_summary_on_youth_umemployment_diff_avg", using: :btree
    t.index ["youth_unemployemnt_percent"], name: "idx_area_summary_on_youth_umemployment_pct", using: :btree
    t.index ["youth_unemployment_count"], name: "idx_area_summary_on_youth_umemployment_cnt", using: :btree
  end

  create_table "area_unemployments", force: :cascade do |t|
    t.string   "area_type"
    t.string   "area_id"
    t.date     "statistic_date"
    t.integer  "unemployed_count"
    t.float    "unemployed_percent"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["area_type", "area_id"], name: "idx_area_unemployment_on_area", using: :btree
    t.index ["statistic_date"], name: "idx_area_unemployment_on_stat_date", using: :btree
  end

  create_table "area_youth_unemployments", force: :cascade do |t|
    t.string   "area_type"
    t.string   "area_id"
    t.date     "statistic_date"
    t.integer  "youth_unemployed_count"
    t.float    "youth_unemployed_percent"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["area_type", "area_id"], name: "idx_area_youth_unemployment_on_area", using: :btree
    t.index ["statistic_date"], name: "idx_area_youth_unemployment_on_stat_date", using: :btree
  end

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

  create_table "constituency_election_summaries", force: :cascade do |t|
    t.string   "election_rankable_type"
    t.integer  "election_rankable_id"
    t.boolean  "prediction"
    t.string   "description"
    t.date     "election_date"
    t.string   "election_type"
    t.integer  "electorate_size"
    t.float    "turnout_percent"
    t.float    "postal_percent"
    t.string   "party_1_id"
    t.integer  "party_1_votes"
    t.float    "party_1_vote_share_percent"
    t.integer  "party_1_ahead_behind"
    t.float    "party_1_ahead_behind_percent"
    t.string   "party_2_id"
    t.integer  "party_2_votes"
    t.float    "party_2_vote_share_percent"
    t.integer  "party_2_ahead_behind"
    t.float    "party_2_ahead_behind_percent"
    t.string   "party_3_id"
    t.integer  "party_3_votes"
    t.float    "party_3_vote_share_percent"
    t.integer  "party_3_ahead_behind"
    t.float    "party_3_ahead_behind_percent"
    t.string   "party_4_id"
    t.integer  "party_4_votes"
    t.float    "party_4_vote_share_percent"
    t.integer  "party_4_ahead_behind"
    t.float    "party_4_ahead_behind_percent"
    t.string   "party_5_id"
    t.integer  "party_5_votes"
    t.float    "party_5_vote_share_percent"
    t.integer  "party_5_ahead_behind"
    t.float    "party_5_ahead_behind_percent"
    t.string   "con_id"
    t.integer  "con_position"
    t.integer  "con_votes"
    t.float    "con_vote_share_percent"
    t.integer  "con_ahead_behind"
    t.float    "con_ahead_behind_percent"
    t.string   "lab_id"
    t.integer  "lab_position"
    t.integer  "lab_votes"
    t.float    "lab_vote_share_percent"
    t.integer  "lab_ahead_behind"
    t.float    "lab_ahead_behind_percent"
    t.string   "ld_id"
    t.integer  "ld_position"
    t.integer  "ld_votes"
    t.float    "ld_vote_share_percent"
    t.integer  "ld_ahead_behind"
    t.float    "ld_ahead_behind_percent"
    t.string   "grn_id"
    t.integer  "grn_position"
    t.integer  "grn_votes"
    t.float    "grn_vote_share_percent"
    t.integer  "grn_ahead_behind"
    t.float    "grn_ahead_behind_percent"
    t.string   "ukip_id"
    t.integer  "ukip_position"
    t.integer  "ukip_votes"
    t.float    "ukip_vote_share_percent"
    t.integer  "ukip_ahead_behind"
    t.float    "ukip_ahead_behind_percent"
    t.string   "snp_id"
    t.integer  "snp_position"
    t.integer  "snp_votes"
    t.float    "snp_vote_share_percent"
    t.integer  "snp_ahead_behind"
    t.float    "snp_ahead_behind_percent"
    t.string   "pc_id"
    t.integer  "pc_position"
    t.integer  "pc_votes"
    t.float    "pc_vote_share_percent"
    t.integer  "pc_ahead_behind"
    t.float    "pc_ahead_behind_percent"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["con_ahead_behind"], name: "idx_const_electn_smry_on_con_ahead_behind", using: :btree
    t.index ["con_ahead_behind_percent"], name: "idx_const_electn_smry_on_con_ahead_behind_pct", using: :btree
    t.index ["con_position"], name: "idx_const_electn_smry_on_con_pos", using: :btree
    t.index ["con_vote_share_percent"], name: "idx_const_electn_smry_on_con_vote_pct", using: :btree
    t.index ["con_votes"], name: "idx_const_electn_smry_on_con_votes", using: :btree
    t.index ["description"], name: "idx_const_electn_smry_on_desc", using: :btree
    t.index ["election_date"], name: "idx_const_electn_smry_on_electn_date", using: :btree
    t.index ["election_rankable_type", "election_rankable_id"], name: "idx_const_electn_smry_on_electn_rnkable", unique: true, using: :btree
    t.index ["election_type"], name: "idx_const_electn_smry_on_electn_type", using: :btree
    t.index ["electorate_size"], name: "idx_const_electn_smry_on_electrte_size", using: :btree
    t.index ["grn_ahead_behind"], name: "idx_const_electn_smry_on_grn_ahead_behind", using: :btree
    t.index ["grn_ahead_behind_percent"], name: "idx_const_electn_smry_on_grn_ahead_behind_pct", using: :btree
    t.index ["grn_position"], name: "idx_const_electn_smry_on_grn_pos", using: :btree
    t.index ["grn_vote_share_percent"], name: "idx_const_electn_smry_on_grn_vote_pct", using: :btree
    t.index ["grn_votes"], name: "idx_const_electn_smry_on_grn_votes", using: :btree
    t.index ["lab_ahead_behind"], name: "idx_const_electn_smry_on_lab_ahead_behind", using: :btree
    t.index ["lab_ahead_behind_percent"], name: "idx_const_electn_smry_on_lab_ahead_behind_pct", using: :btree
    t.index ["lab_position"], name: "idx_const_electn_smry_on_lab_pos", using: :btree
    t.index ["lab_vote_share_percent"], name: "idx_const_electn_smry_on_lab_vote_pct", using: :btree
    t.index ["lab_votes"], name: "idx_const_electn_smry_on_lab_votes", using: :btree
    t.index ["ld_ahead_behind"], name: "idx_const_electn_smry_on_ld_ahead_behind", using: :btree
    t.index ["ld_ahead_behind_percent"], name: "idx_const_electn_smry_on_ld_ahead_behind_pct", using: :btree
    t.index ["ld_position"], name: "idx_const_electn_smry_on_ld_pos", using: :btree
    t.index ["ld_vote_share_percent"], name: "idx_const_electn_smry_on_ld_vote_pct", using: :btree
    t.index ["ld_votes"], name: "idx_const_electn_smry_on_ld_votes", using: :btree
    t.index ["party_1_ahead_behind"], name: "idx_const_electn_smry_on_pty_1_ahead_behind", using: :btree
    t.index ["party_1_ahead_behind_percent"], name: "idx_const_electn_smry_on_pty_1_ahead_behind_percent", using: :btree
    t.index ["party_1_vote_share_percent"], name: "idx_const_electn_smry_on_pty_1_vote_pct", using: :btree
    t.index ["party_1_votes"], name: "idx_const_electn_smry_on_pty_1_vote", using: :btree
    t.index ["party_2_ahead_behind"], name: "idx_const_electn_smry_on_pty_2_ahead_behind", using: :btree
    t.index ["party_2_ahead_behind_percent"], name: "idx_const_electn_smry_on_pty_2_ahead_behind_percent", using: :btree
    t.index ["party_2_vote_share_percent"], name: "idx_const_electn_smry_on_pty_2_vote_pct", using: :btree
    t.index ["party_2_votes"], name: "idx_const_electn_smry_on_pty_2_vote", using: :btree
    t.index ["party_3_ahead_behind"], name: "idx_const_electn_smry_on_pty_3_ahead_behind", using: :btree
    t.index ["party_3_ahead_behind_percent"], name: "idx_const_electn_smry_on_pty_3_ahead_behind_percent", using: :btree
    t.index ["party_3_vote_share_percent"], name: "idx_const_electn_smry_on_pty_3_vote_pct", using: :btree
    t.index ["party_3_votes"], name: "idx_const_electn_smry_on_pty_3_vote", using: :btree
    t.index ["party_4_ahead_behind"], name: "idx_const_electn_smry_on_pty_4_ahead_behind", using: :btree
    t.index ["party_4_ahead_behind_percent"], name: "idx_const_electn_smry_on_pty_4_ahead_behind_percent", using: :btree
    t.index ["party_4_vote_share_percent"], name: "idx_const_electn_smry_on_pty_4_vote_pct", using: :btree
    t.index ["party_4_votes"], name: "idx_const_electn_smry_on_pty_4_vote", using: :btree
    t.index ["party_5_ahead_behind"], name: "idx_const_electn_smry_on_pty_5_ahead_behind", using: :btree
    t.index ["party_5_ahead_behind_percent"], name: "idx_const_electn_smry_on_pty_5_ahead_behind_percent", using: :btree
    t.index ["party_5_vote_share_percent"], name: "idx_const_electn_smry_on_pty_5_vote_pct", using: :btree
    t.index ["party_5_votes"], name: "idx_const_electn_smry_on_pty_5_vote", using: :btree
    t.index ["pc_ahead_behind"], name: "idx_const_electn_smry_on_pc_ahead_behind", using: :btree
    t.index ["pc_ahead_behind_percent"], name: "idx_const_electn_smry_on_pc_ahead_behind_pct", using: :btree
    t.index ["pc_position"], name: "idx_const_electn_smry_on_pc_pos", using: :btree
    t.index ["pc_vote_share_percent"], name: "idx_const_electn_smry_on_pc_vote_pct", using: :btree
    t.index ["pc_votes"], name: "idx_const_electn_smry_on_pc_votes", using: :btree
    t.index ["postal_percent"], name: "idx_const_electn_smry_on_postal_pct", using: :btree
    t.index ["prediction"], name: "idx_const_electn_smry_on_prediction", using: :btree
    t.index ["snp_ahead_behind"], name: "idx_const_electn_smry_on_snp_ahead_behind", using: :btree
    t.index ["snp_ahead_behind_percent"], name: "idx_const_electn_smry_on_snp_ahead_behind_pct", using: :btree
    t.index ["snp_position"], name: "idx_const_electn_smry_on_snp_pos", using: :btree
    t.index ["snp_vote_share_percent"], name: "idx_const_electn_smry_on_snp_vote_pct", using: :btree
    t.index ["snp_votes"], name: "idx_const_electn_smry_on_snp_votes", using: :btree
    t.index ["turnout_percent"], name: "idx_const_electn_smry_on_turnout_pct", using: :btree
    t.index ["ukip_ahead_behind"], name: "idx_const_electn_smry_on_ukip_ahead_behind", using: :btree
    t.index ["ukip_ahead_behind_percent"], name: "idx_const_electn_smry_on_ukip_ahead_behind_pct", using: :btree
    t.index ["ukip_position"], name: "idx_const_electn_smry_on_ukip_pos", using: :btree
    t.index ["ukip_vote_share_percent"], name: "idx_const_electn_smry_on_ukip_vote_pct", using: :btree
    t.index ["ukip_votes"], name: "idx_const_electn_smry_on_ukip_votes", using: :btree
  end

  create_table "constituency_election_votes", force: :cascade do |t|
    t.string   "election_voteable_type"
    t.integer  "election_voteable_id"
    t.string   "party_id"
    t.string   "candidate_name"
    t.boolean  "candidate_incumbent"
    t.integer  "votes"
    t.float    "vote_share_percent"
    t.float    "percent_change_from_last_ge"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["election_voteable_type", "election_voteable_id"], name: "idx_const_electn_votes_on_const_electn_voteable", using: :btree
    t.index ["party_id"], name: "idx_const_electn_votes_on_pty", using: :btree
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
    t.string   "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_countries_on_state_id", using: :btree
  end

  create_table "local_authorities", id: :string, force: :cascade do |t|
    t.string   "name"
    t.string   "region_id"
    t.boolean  "abolished",      default: false
    t.date     "abolished_date"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["name"], name: "index_local_authorities_on_name", using: :btree
    t.index ["region_id"], name: "index_local_authorities_on_region_id", using: :btree
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

  create_table "states", id: :string, force: :cascade do |t|
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
    t.boolean  "abolished",          default: false
    t.date     "abolished_date"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["local_authority_id"], name: "index_wards_on_local_authority_id", using: :btree
    t.index ["name"], name: "index_wards_on_name", using: :btree
  end

  add_foreign_key "constituencies", "regions"
  add_foreign_key "constituency_election_predictions", "constituency_elections"
  add_foreign_key "constituency_election_results", "constituency_elections"
  add_foreign_key "constituency_election_summaries", "parties", column: "con_id"
  add_foreign_key "constituency_election_summaries", "parties", column: "grn_id"
  add_foreign_key "constituency_election_summaries", "parties", column: "lab_id"
  add_foreign_key "constituency_election_summaries", "parties", column: "ld_id"
  add_foreign_key "constituency_election_summaries", "parties", column: "party_1_id"
  add_foreign_key "constituency_election_summaries", "parties", column: "party_2_id"
  add_foreign_key "constituency_election_summaries", "parties", column: "party_3_id"
  add_foreign_key "constituency_election_summaries", "parties", column: "party_4_id"
  add_foreign_key "constituency_election_summaries", "parties", column: "party_5_id"
  add_foreign_key "constituency_election_summaries", "parties", column: "pc_id"
  add_foreign_key "constituency_election_summaries", "parties", column: "snp_id"
  add_foreign_key "constituency_election_summaries", "parties", column: "ukip_id"
  add_foreign_key "constituency_election_votes", "parties"
  add_foreign_key "constituency_elections", "constituencies"
  add_foreign_key "constituency_eu_votes", "constituencies"
  add_foreign_key "constituency_wards", "constituencies"
  add_foreign_key "constituency_wards", "wards"
  add_foreign_key "countries", "states"
  add_foreign_key "local_authorities", "regions"
  add_foreign_key "regions", "countries"
  add_foreign_key "ward_eu_votes", "wards"
  add_foreign_key "wards", "local_authorities"
end
