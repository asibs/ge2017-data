class CreateAreaEuVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :area_eu_votes do |t|
      t.references :area, type: :string, polymorphic: true, index: { name: 'idx_area_eu_vote_on_area' }
      t.boolean :contains_postal_votes
      t.integer :actual_leave_votes
      t.integer :actual_remain_votes
      t.float :actual_leave_vote_percent
      t.float :estimated_leave_vote_percent

      t.timestamps
    end
  end
end
