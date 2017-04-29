class CreateWards < ActiveRecord::Migration[5.0]
  def change
    create_table :wards, id: :string do |t|
      t.string :name
      t.references :local_authority, type: :string, foreign_key: true

      t.timestamps
    end
  end
end
