class CreateAreaIncapacityBenefits < ActiveRecord::Migration[5.0]
  def change
    create_table :area_incapacity_benefits do |t|
      t.references :area, type: :string, polymorphic: true, index: { name: 'idx_area_incap_benefits_on_area' }
      t.date :statistic_date, index: { name: 'idx_area_incap_benefits_on_stat_date' }
      t.integer :incapacity_benefits_count
      t.integer :incapacity_benefits_percent

      t.timestamps
    end
  end
end
