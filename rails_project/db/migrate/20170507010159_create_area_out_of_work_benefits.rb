class CreateAreaOutOfWorkBenefits < ActiveRecord::Migration[5.0]
  def change
    create_table :area_out_of_work_benefits do |t|
      t.references :area, type: :string, polymorphic: true, index: { name: 'idx_area_oow_benefits_on_area' }
      t.date :statistic_date, index: { name: 'idx_area_oow_benefits_on_stat_date' }
      t.integer :oow_benefits_count
      t.float :oow_benefits_percent

      t.timestamps
    end
  end
end
