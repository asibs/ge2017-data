class CreateConstituencyElectionPartyRanks < ActiveRecord::Migration[5.0]
  def change
    create_table :constituency_election_party_ranks do |t|
      t.references :election_rankable, polymorphic: true, index: { name: 'idx_const_electn_pty_rnk_on_electn_rnkable', unique: true }
      t.boolean :prediction, index: true
      t.string :description, index: true

      (1..5).each do |i|
        t.string "party_#{i}_id"
        t.integer "party_#{i}_votes", index: { name: "idx_const_electn_pty_rnk_on_pty_#{i}_vote" }
        t.float "party_#{i}_vote_share_percent", index: { name: "idx_const_electn_pty_rnk_on_pty_#{i}_vote_percent" }
        t.integer "party_#{i}_votes_behind", index: { name: "idx_const_electn_pty_rnk_on_pty_#{i}_vote_behind" }
        t.float "party_#{i}_vote_share_percent_behind", index: { name: "idx_const_electn_pty_rnk_on_pty_#{i}_vote_percent_behind" }
      end

      t.timestamps
    end

    (1..5).each do |i|
      add_foreign_key :constituency_election_party_ranks, :parties, column: "party_#{i}_id",
                      index: { name: "idx_const_electn_pty_rnk_on_pty_#{i}_id" }
    end
  end
end
