class CreateJoinTableConstituencyWards < ActiveRecord::Migration[5.0]
  def change
    create_table :constituency_wards, id: false do |t|
      t.references :constituency, type: :string, foreign_key: true
      t.references :ward, type: :string, foreign_key: true

      t.timestamps

      t.index [:constituency_id, :ward_id], unique: true, name: 'idx_const_wards_on_const_and_ward'
    end
  end
end
