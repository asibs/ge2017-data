class ConstituencySummary < ApplicationRecord
  belongs_to :constituency

  belongs_to :party_1, class_name: "Party"
  belongs_to :party_2, class_name: "Party"
  belongs_to :party_3, class_name: "Party"
  belongs_to :party_4, class_name: "Party"
  belongs_to :party_5, class_name: "Party"


  def seat_classification
    allies = ['LAB', 'LD', 'GRN', 'SNP', 'PC']

    if allies.include?(party_1_id) then
      if (CON_votes + UKIP_votes > party_1_votes) || (CON_vote_share_percent + 5 > party_1_vote_share_percent - 5) then
        return "Seat held by #{party_1.name} (#{party_1_vote_share_percent.round(2)}%), but under threat from Conservatives (#{CON_vote_share_percent.round(2)}%)"
      else
        return "Seat held by #{party_1.name} (#{party_1_vote_share_percent.round(2)}%), and should be safe from Conservatives"
      end
    else
      if (allies.include?(party_2_id) && party_1_vote_share_percent - 5 < party_2_vote_share_percent + 5 ) then
        return "Seat held by #{party_1.name} (#{party_1_vote_share_percent.round(2)}%), but under threat from #{party_2.name} (#{party_2_vote_share_percent.round(2)}%)"
      else
        return "Seat held by #{party_1.name} (#{party_1_vote_share_percent.round(2)}%), and looks unlikely to change hands"
      end
    end

  end

  def population_summary

  end

end
