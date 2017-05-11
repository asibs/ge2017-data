module ElectionDataUtils
  MAJOR_PARTIES = ['CON', 'LAB', 'LD', 'GRN', 'UKIP', 'SNP', 'PC']
  ALLY_PARTIES = ['LAB', 'LD', 'GRN', 'SNP', 'PC']

  # Add '+' on front of positive numbers, leave 0 with nothing, negatives will already get '-'
  def self.percent_change_to_s(swing)
    return "Unknown" if (swing.nil? || swing == "")

    begin
      (Integer(swing) > 0) ? "+" + swing.to_s : swing.to_s
    rescue ArgumentError
      swing.to_s
    end
  end


  def self.seat_classification(constituency_election_summary)
    if ALLY_PARTIES.include?(party_1_id) then
      if (CON_votes + UKIP_votes > party_1_votes) || (CON_vote_share_percent + 5 > party_1_vote_share_percent - 5) then
        return "Seat held by #{party_1.name} (#{party_1_vote_share_percent.round(2)}%), but under threat from Conservatives (#{CON_vote_share_percent.round(2)}%)"
      else
        return "Seat held by #{party_1.name} (#{party_1_vote_share_percent.round(2)}%), and should be safe from Conservatives"
      end
    else
      if (ALLY_PARTIES.include?(party_2_id) && party_1_vote_share_percent - 5 < party_2_vote_share_percent + 5 ) then
        return "Seat held by #{party_1.name} (#{party_1_vote_share_percent.round(2)}%), but could be taken by #{party_2.name} (#{party_2_vote_share_percent.round(2)}%)"
      else
        return "Seat held by #{party_1.name} (#{party_1_vote_share_percent.round(2)}%), and looks unlikely to be taken by a progressive party"
      end
    end
  end
  
end
