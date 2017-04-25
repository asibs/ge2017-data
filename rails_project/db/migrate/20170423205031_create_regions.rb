class CreateRegions < ActiveRecord::Migration[5.0]
  def change
    create_table :regions, id: :string do |t|
      t.string :name
      t.string :country

      t.timestamps
    end
  end
end
