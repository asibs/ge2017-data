class CreateAreaUnemployments < ActiveRecord::Migration[5.0]
  def change
    create_table :area_unemployments do |t|
      t.references :area, type: :string, polymorphic: true, index: { name: 'idx_area_unemployment_on_area' }
      t.date :statistic_date, index: { name: 'idx_area_unemployment_on_stat_date' }
      t.integer :unemployed_count
      t.float :unemployed_percent

      t.timestamps
    end
  end
end
