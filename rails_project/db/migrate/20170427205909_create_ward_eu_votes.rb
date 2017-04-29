class CreateWardEuVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :ward_eu_votes do |t|
      t.references :ward, type: :string, foreign_key: true
      t.integer :known_leave_votes
      t.integer :known_remain_votes
      t.float :known_leave_vote_percent
      t.float :known_remain_vote_percent
      t.boolean :contains_postal_votes

      t.timestamps
    end
  end
end
