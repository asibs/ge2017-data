class CreateConstituencies < ActiveRecord::Migration[5.0]
  def change
    create_table :constituencies, id: :string do |t|
      t.integer :pano
      t.string :name
      t.string :constituency_type
      t.string :county
      t.references :region, type: :string, foreign_key: true

      t.timestamps
    end
  end
end
