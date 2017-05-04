class CreateRegions < ActiveRecord::Migration[5.0]
  def change
    create_table :regions, id: :string do |t|
      t.string :name, index: true
      t.references :country, type: :string, foreign_key: true

      t.timestamps
    end
  end
end
