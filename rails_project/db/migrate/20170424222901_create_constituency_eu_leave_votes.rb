class CreateConstituencyEuLeaveVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :constituency_eu_leave_votes do |t|
      t.references :constituency, type: :string, foreign_key: true
      t.float :estimated_leave_vote_percent
      t.float :known_leave_vote_percent

      t.timestamps
    end
  end
end
