class CreateJoinTableConstituencyWards < ActiveRecord::Migration[5.0]
  def change
    create_table :constituency_wards, id: false do |t|
      t.references :constituency, type: :string, foreign_key: true
      t.references :ward, type: :string, foreign_key: true

      t.index [:constituency_id, :ward_id]
    end
  end
end
