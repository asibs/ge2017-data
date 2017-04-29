class ConstituencyEuVote < ApplicationRecord
  belongs_to :constituency

  def leave_vote_percent_to_use
    known_leave_vote_percent || estimated_leave_vote_percent
  end

end
