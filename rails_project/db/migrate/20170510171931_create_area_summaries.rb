class CreateAreaSummaries < ActiveRecord::Migration[5.0]
  def change
    create_table :area_summaries do |t|
      t.references :area, type: :string, polymorphic: true, index: { name: 'idx_area_summary_on_area', unique: true }
      t.string :area_name

      t.float :eu_ref_leave_vote_percent

      t.date :pop_estimate_date
      t.integer :pop_total, index: { name: 'idx_area_summary_on_pop_total' }
      t.integer :pop_total_f, index: { name: 'idx_area_summary_on_pop_total_f' }
      t.float :pop_total_f_percent, index: { name: 'idx_area_summary_on_pop_total_f_pct' }
      t.float :pop_total_f_diff_avg, index: { name: 'idx_area_summary_on_pop_total_f_diff_avg' }
      t.integer :pop_total_m, index: { name: 'idx_area_summary_on_pop_total_m' }
      t.float :pop_total_m_percent, index: { name: 'idx_area_summary_on_pop_total_m_pct' }
      t.float :pop_total_m_diff_avg, index: { name: 'idx_area_summary_on_pop_total_m_diff_avg' }
      t.integer :pop_0_17, index: { name: 'idx_area_summary_on_pop_0_17' }
      t.float :pop_0_17_percent, index: { name: 'idx_area_summary_on_pop_0_17_pct' }
      t.float :pop_0_17_diff_avg, index: { name: 'idx_area_summary_on_pop_0_17_diff_avg' }
      t.integer :pop_18_34, index: { name: 'idx_area_summary_on_pop_18_34' }
      t.float :pop_18_34_percent, index: { name: 'idx_area_summary_on_pop_18_34_pct' }
      t.float :pop_18_34_diff_avg, index: { name: 'idx_area_summary_on_pop_18_34_diff_avg' }
      t.integer :pop_35_49, index: { name: 'idx_area_summary_on_pop_35_49' }
      t.float :pop_35_49_percent, index: { name: 'idx_area_summary_on_pop_35_49_pct' }
      t.float :pop_35_49_diff_avg, index: { name: 'idx_area_summary_on_pop_35_49_diff_avg' }
      t.integer :pop_50_64, index: { name: 'idx_area_summary_on_pop_50_64' }
      t.float :pop_50_64_percent, index: { name: 'idx_area_summary_on_pop_50_64_pct' }
      t.float :pop_50_64_diff_avg, index: { name: 'idx_area_summary_on_pop_50_64_diff_avg' }
      t.integer :pop_65_plus, index: { name: 'idx_area_summary_on_pop_65_plus' }
      t.float :pop_65_plus_percent, index: { name: 'idx_area_summary_on_pop_65_plus_pct' }
      t.float :pop_65_plus_diff_avg, index: { name: 'idx_area_summary_on_pop_65_plus_diff_avg' }

      t.date :unemployment_date
      t.integer :unemployment_count, index: { name: 'idx_area_summary_on_umemployment_cnt' }
      t.float :unemployemnt_percent, index: { name: 'idx_area_summary_on_umemployment_pct' }
      t.float :unemployemnt_diff_avg, index: { name: 'idx_area_summary_on_umemployment_diff_avg' }

      t.date :youth_unemployment_date
      t.integer :youth_unemployment_count, index: { name: 'idx_area_summary_on_youth_umemployment_cnt' }
      t.float :youth_unemployemnt_percent, index: { name: 'idx_area_summary_on_youth_umemployment_pct' }
      t.float :youth_unemployemnt_diff_avg, index: { name: 'idx_area_summary_on_youth_umemployment_diff_avg' }

      t.date :oow_benefits_date
      t.integer :oow_benefits_count, index: { name: 'idx_area_summary_on_oow_benefit_cnt' }
      t.float :oow_benefits_percent, index: { name: 'idx_area_summary_on_oow_benefit_pct' }
      t.float :oow_benefits_diff_avg, index: { name: 'idx_area_summary_on_oow_benefit_diff_avg' }

      t.date :incapacity_benefits_date
      t.integer :incapacity_benefits_count, index: { name: 'idx_area_summary_on_incapacity_benefit_cnt' }
      t.float :incapacity_benefits_percent, index: { name: 'idx_area_summary_on_incapacity_benefit_pct' }
      t.float :incapacity_benefits_diff_avg, index: { name: 'idx_area_summary_on_incapacity_benefit_diff_avg' }

      t.date :median_wage_date
      t.integer :median_wage, index: { name: 'idx_area_summary_on_median_wage' }
      t.integer :median_wage_diff_avg, index: { name: 'idx_area_summary_on_median_wage_diff_avg' }

      t.timestamps
    end
  end
end
