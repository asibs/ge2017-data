class CreateCountries < ActiveRecord::Migration[5.0]
  def change
    create_table :countries, id: :string do |t|

      t.timestamps
    end
  end
end
