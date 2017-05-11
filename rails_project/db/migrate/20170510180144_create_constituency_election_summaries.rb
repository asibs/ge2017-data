class CreateConstituencyElectionSummaries < ActiveRecord::Migration[5.0]
  def change
    create_table :constituency_election_summaries do |t|
      t.references :election_rankable, polymorphic: true, index: { name: 'idx_const_electn_smry_on_electn_rnkable', unique: true }

      t.boolean :prediction, index: { name: 'idx_const_electn_smry_on_prediction' }
      t.string :description, index: { name: 'idx_const_electn_smry_on_desc' }
      t.date :election_date, index: { name: 'idx_const_electn_smry_on_electn_date' }
      t.string :election_type, index: { name: 'idx_const_electn_smry_on_electn_type' }

      t.integer :electorate_size, index: { name: 'idx_const_electn_smry_on_electrte_size' }
      t.float :turnout_percent, index: { name: 'idx_const_electn_smry_on_turnout_pct' }
      t.float :postal_percent, index: { name: 'idx_const_electn_smry_on_postal_pct' }

      (1..5).each do |i|
        t.string "party_#{i}_id"
        t.integer "party_#{i}_votes", index: { name: "idx_const_electn_smry_on_pty_#{i}_vote" }
        t.float "party_#{i}_vote_share_percent", index: { name: "idx_const_electn_smry_on_pty_#{i}_vote_pct" }
        t.integer "party_#{i}_ahead_behind", index: { name: "idx_const_electn_smry_on_pty_#{i}_ahead_behind" }
        t.float "party_#{i}_ahead_behind_percent", index: { name: "idx_const_electn_smry_on_pty_#{i}_ahead_behind_percent" }
      end

      ["CON", "LAB", "LD", "GRN", "UKIP", "SNP", "PC"].each do |party|
        party = party.downcase
        t.string "#{party}_id"
        t.integer "#{party}_position", index: { name: "idx_const_electn_smry_on_#{party}_pos" }
        t.integer "#{party}_votes", index: { name: "idx_const_electn_smry_on_#{party}_votes" }
        t.float "#{party}_vote_share_percent", index: { name: "idx_const_electn_smry_on_#{party}_vote_pct" }
        t.integer "#{party}_ahead_behind", index: { name: "idx_const_electn_smry_on_#{party}_ahead_behind" }
        t.float "#{party}_ahead_behind_percent", index: { name: "idx_const_electn_smry_on_#{party}_ahead_behind_pct" }
      end

      t.timestamps
    end

    (1..5).each do |i|
      add_foreign_key :constituency_election_summaries, :parties, column: "party_#{i}_id",
                      index: { name: "idx_const_electn_smry_on_pty_#{i}_id" }
    end

    ["CON", "LAB", "LD", "GRN", "UKIP", "SNP", "PC"].each do |party|
      party = party.downcase
      add_foreign_key :constituency_election_summaries, :parties, column: "#{party}_id",
                      index: { name: "idx_const_electn_smry_on_#{party}_id" }
    end

  end
end
