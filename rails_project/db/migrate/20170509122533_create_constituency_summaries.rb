class CreateConstituencySummaries < ActiveRecord::Migration[5.0]
  def change
    create_table :constituency_summaries do |t|
      t.references :constituency, type: :string, foreign_key: true, index: { name: 'idx_const_summary_on_constituency' }
      t.string :constituency_name
      t.string :constituency_region
      t.string :constituency_country

      t.date :prev_election_date
      t.string :prev_election_type
      t.integer :prev_election_electorate_size
      t.float :prev_election_turnout_percent
      t.float :prev_election_postal_percent

      (1..5).each do |i|
        t.string "party_#{i}_id"
        t.integer "party_#{i}_votes", index: { name: "idx_const_summary_on_pty_#{i}_vote" }
        t.float "party_#{i}_vote_share_percent", index: { name: "idx_const_summary_on_pty_#{i}_vote_pct" }
        t.integer "party_#{i}_ahead_behind", index: { name: "idx_const_summary_on_pty_#{i}_ahead_behind" }
        t.float "party_#{i}_ahead_behind_percent", index: { name: "idx_const_summary_on_pty_#{i}_ahead_behind_percent" }
      end

      ["CON", "LAB", "LD", "GRN", "UKIP", "SNP", "PC"].each do |party|
        t.integer "#{party}_position", index: { name: "idx_const_summary_on_#{party}_pos" }
        t.integer "#{party}_votes", index: { name: "idx_const_summary_on_#{party}_votes" }
        t.float "#{party}_vote_share_percent", index: { name: "idx_const_summary_on_#{party}_vote_pct" }
        t.integer "#{party}_ahead_behind", index: { name: "idx_const_summary_on_#{party}_ahead_behind" }
        t.float "#{party}_ahead_behind_percent", index: { name: "idx_const_summary_on_#{party}_ahead_behind_pct" }
      end

      t.float :eu_ref_leave_vote_percent

      t.date :pop_estimate_date
      t.integer :pop_total, index: { name: 'idx_const_summary_on_pop_total' }
      t.integer :pop_total_f, index: { name: 'idx_const_summary_on_pop_total_f' }
      t.integer :pop_total_m, index: { name: 'idx_const_summary_on_pop_total_m' }
      t.integer :pop_0_17, index: { name: 'idx_const_summary_on_pop_0_17' }
      t.float :pop_0_17_percent, index: { name: 'idx_const_summary_on_pop_0_17_percent' }
      t.integer :pop_18_34, index: { name: 'idx_const_summary_on_pop_18_34' }
      t.float :pop_18_34_percent, index: { name: 'idx_const_summary_on_pop_18_34_percent' }
      t.integer :pop_35_49, index: { name: 'idx_const_summary_on_pop_35_49' }
      t.float :pop_35_49_percent, index: { name: 'idx_const_summary_on_pop_35_49_percent' }
      t.integer :pop_50_64, index: { name: 'idx_const_summary_on_pop_50_64' }
      t.float :pop_50_64_percent, index: { name: 'idx_const_summary_on_pop_50_64_percent' }
      t.integer :pop_65_plus, index: { name: 'idx_const_summary_on_pop_65_plus' }
      t.float :pop_65_plus_percent, index: { name: 'idx_const_summary_on_pop_65_plus_percent' }

      t.date :unemployment_date
      t.integer :unemployment_count, index: { name: 'idx_const_summary_on_umemployment_cnt' }
      t.float :unemployemnt_percent, index: { name: 'idx_const_summary_on_umemployment_pct' }

      t.date :youth_unemployment_date
      t.integer :youth_unemployment_count, index: { name: 'idx_const_summary_on_youth_umemployment_cnt' }
      t.float :youth_unemployemnt_percent, index: { name: 'idx_const_summary_on_youth_umemployment_pct' }

      t.date :oow_benefits_date
      t.integer :oow_benefits_count, index: { name: 'idx_const_summary_on_oow_benefit_cnt' }
      t.float :oow_benefits_percent, index: { name: 'idx_const_summary_on_oow_benefit_pct' }

      t.date :incapacity_benefits_date
      t.integer :incapacity_benefits_count, index: { name: 'idx_const_summary_on_incapacity_benefit_cnt' }
      t.float :incapacity_benefits_percent, index: { name: 'idx_const_summary_on_incapacity_benefit_pct' }

      t.date :median_wage_date
      t.integer :median_wage, index: { name: 'idx_const_summary_on_median_wage' }

      t.timestamps
    end

    (1..5).each do |i|
      add_foreign_key :constituency_summaries, :parties, column: "party_#{i}_id",
                      index: { name: "idx_const_summary_on_pty_#{i}_id" }
    end
  end
end
