class CreateConstituencyElectionPredictions < ActiveRecord::Migration[5.0]
  def change
    create_table :constituency_election_predictions do |t|
      t.references :constituency_election, foreign_key: true, index: { name: 'idx_const_electn_predictions_on_const_electn' }
      t.string :prediction_description
      t.references :party, type: :string, foreign_key: true, index: { name: 'idx_const_electn_predictions_on_parties' }
      t.float :predicted_swing
      t.float :predicted_vote_share_percent

      t.timestamps
    end
  end
end
