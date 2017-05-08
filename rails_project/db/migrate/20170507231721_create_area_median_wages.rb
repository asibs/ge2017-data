class CreateAreaMedianWages < ActiveRecord::Migration[5.0]
  def change
    create_table :area_median_wages do |t|
      t.references :area, type: :string, polymorphic: true, index: { name: 'idx_area_median_wage_on_area' }
      t.date :statistic_date, index: { name: 'idx_area_median_wage_on_stat_date' }
      t.integer :median_wage

      t.timestamps
    end
  end
end
