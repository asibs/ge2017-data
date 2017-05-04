class CreateConstituencyElectionPredictedVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :constituency_election_predicted_votes do |t|
      t.references :constituency_election_prediction, foreign_key: true, index: { name: 'idx_const_electn_predicted_votes_on_const_electn' }
      t.references :party, type: :string, foreign_key: true, index: { name: 'idx_const_electn_predicted_votes_on_parties' }
      t.float :predicted_swing
      t.float :predicted_vote_share_percent

      t.timestamps

      t.index [:constituency_election_prediction_id, :party_id], unique: true, name: 'idx_const_electn_prdctn_votes_on_const_electn_and_dscrptn'
    end
  end
end
