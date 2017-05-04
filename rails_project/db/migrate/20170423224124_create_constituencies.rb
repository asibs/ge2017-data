class CreateConstituencies < ActiveRecord::Migration[5.0]
  def change
    create_table :constituencies, id: :string do |t|
      t.integer :pano, index: true
      t.string :name, index: true
      t.string :constituency_type
      t.string :county
      t.references :region, type: :string, foreign_key: true
      t.boolean :abolished, default: false
      t.date :abolished_date, default: nil

      t.timestamps
    end
  end
end
