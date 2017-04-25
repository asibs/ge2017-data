class CreateConstituencyElections < ActiveRecord::Migration[5.0]
  def change
    create_table :constituency_elections do |t|
      t.references :constituency, type: :string, foreign_key: true
      t.string :election_type
      t.string :election_sub_type
      t.date :election_date
      t.integer :electorate_size
      t.integer :total_valid_votes_counted
      t.integer :postal_votes_issued
      t.integer :valid_postal_votes_counted

      t.timestamps
    end
  end
end
