class CreateConstituencyElectionVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :constituency_election_votes do |t|
      t.references :election_voteable, polymorphic: true, index: { name: 'idx_const_electn_votes_on_const_electn_voteable' }
      t.references :party, type: :string, foreign_key: true, index: { name: "idx_const_electn_votes_on_pty" }
      t.string :candidate_name
      t.boolean :candidate_incumbent
      t.integer :votes
      t.float :vote_share_percent
      t.float :percent_change_from_last_ge

      t.timestamps

      # Note: No multi-column index on constituency_election & party here, same party could stand multiple candidates in theory.
      # In practice, only really affects special Independent / Other / Unknown parties
    end
  end
end
