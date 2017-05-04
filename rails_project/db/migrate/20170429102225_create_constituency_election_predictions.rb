class CreateConstituencyElectionPredictions < ActiveRecord::Migration[5.0]
  def change
    create_table :constituency_election_predictions do |t|
      t.references :constituency_election, foreign_key: true, index: { name: 'idx_const_electn_prdctns_on_const_electn' }
      t.string :prediction_description

      t.timestamps

      t.index [:constituency_election_id, :prediction_description], unique: true, name: 'idx_const_electn_prdctn_on_const_and_dscrptn'
    end
  end
end
