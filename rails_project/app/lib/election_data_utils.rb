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


  def self.classify_statistic(stat, compare_stat, classifications)
    return nil if stat.nil? || compare_stat.nil?

    classifications.each do |classification, bounds|
      if bounds[:max].nil? then
        return classification if stat > compare_stat + bounds[:min]
      elsif bounds[:min].nil?
        return classification if stat < compare_stat + bounds[:max]
      else
        return classification if stat.between?(compare_stat + bounds[:min], compare_stat + bounds[:max])
      end
    end
  end

  def self.classify_statistic_to_s(stat_description, stat_method, area_summary, compare_to_area_summary, classifications)
    stat = area_summary.public_send(stat_method)
    compare_stat = compare_to_area_summary.public_send(stat_method)
    classification = classify_statistic(stat, compare_stat, classifications)
    compare_area_name = compare_to_area_summary.area.name

    return nil if classification.nil?

    "#{stat_description} is #{classification} for #{compare_area_name}, at #{stat} (Average for #{compare_area_name} is #{compare_stat})"
  end

end
