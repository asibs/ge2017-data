class CreateConstituencyElectionCandidateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :constituency_election_candidate_votes do |t|
      t.references :constituency_election, foreign_key: true, index: { name: 'idx_const_electn_cand_votes_on_const_electn' }
      t.references :party, type: :string, foreign_key: true, index: { name: 'idx_const_electn_cand_votes_on_parties' }
      t.string :candidate_name
      t.boolean :candidate_incumbent
      t.integer :votes
      t.float :vote_share_percent
      t.float :percent_change_from_last_ge

      t.timestamps
    end
  end
end
