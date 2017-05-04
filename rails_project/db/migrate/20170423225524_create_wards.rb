class CreateWards < ActiveRecord::Migration[5.0]
  def change
    create_table :wards, id: :string do |t|
      t.string :name, index: true
      t.references :local_authority, type: :string, foreign_key: true
      t.boolean :abolished, default: false
      t.date :abolished_date, default: nil

      t.timestamps
    end
  end
end
