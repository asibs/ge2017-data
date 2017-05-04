class CreateConstituencyElectionResults < ActiveRecord::Migration[5.0]
  def change
    create_table :constituency_election_results do |t|
      t.references :constituency_election, foreign_key: true, index: { name: 'idx_const_electn_rslt_on_const_electn', unique: true }
      t.string :description

      t.timestamps
    end
  end
end
