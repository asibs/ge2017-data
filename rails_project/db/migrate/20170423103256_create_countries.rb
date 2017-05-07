class CreateCountries < ActiveRecord::Migration[5.0]
  def change
    create_table :countries, id: :string do |t|
      t.references :state, type: :string, foreign_key: true

      t.timestamps
    end
  end
end
