class AreaEuVote < ApplicationRecord
  belongs_to :area, polymorphic: true

  def leave_vote_percent
    actual_leave_vote_percent || estimated_leave_vote_percent
  end
end
