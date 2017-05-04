class CreateConstituencyElections < ActiveRecord::Migration[5.0]
  def change
    create_table :constituency_elections do |t|
      t.references :constituency, type: :string, foreign_key: true
      t.string :election_type, index: true
      t.string :election_sub_type, index: true
      t.date :election_date, index: true
      t.integer :electorate_size
      t.integer :total_valid_votes_counted
      t.integer :postal_votes_issued
      t.integer :valid_postal_votes_counted

      t.timestamps

      t.index [:constituency_id, :election_type, :election_sub_type, :election_date], unique: true, name: 'idx_const_electn_on_const_and_electn_type_and_date'
    end
  end
end
