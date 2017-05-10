class CreateAreaYouthUnemployments < ActiveRecord::Migration[5.0]
  def change
    create_table :area_youth_unemployments do |t|
      t.references :area, type: :string, polymorphic: true, index: { name: 'idx_area_youth_unemployment_on_area' }
      t.date :statistic_date, index: { name: 'idx_area_youth_unemployment_on_stat_date' }
      t.integer :youth_unemployed_count
      t.float :youth_unemployed_percent

      t.timestamps
    end
  end
end
