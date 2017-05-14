module ElectionDataUtils
  MAJOR_PARTIES = ['CON', 'LAB', 'LD', 'GRN', 'UKIP', 'SNP', 'PC']
  ALLY_PARTIES = ['LAB', 'LD', 'GRN', 'SNP', 'PC']

  LEAVE_PCT_CLASS = {very_high: {class: :very_high, description: "Voted very strongly for leaving the EU", min:70, max:nil},
                     high: {class: :high, description: "Voted strongly for leaving the EU", min:60, max:70},
                     little_high: {class: :little_high, description: "Voted for leaving the EU", min:52, max:60},
                     average: {class: :average, description: "Was split relatively evenly on leaving the EU", min:48, max:52},
                     little_low: {class: :little_low, description: "Voted against leaving the EU", min:40, max:48},
                     low: {class: :low, description: "Voted strongly against leaving the EU", min:30, max:40},
                     very_low: {class: :very_low, description: "Voted very strongly against leaving the EU", min:nil, max:30}}

  POPULATION_PCT_CLASS = {very_high: {class: :very_high, description: "much higher than average", min:8, max:nil},
                          high: {class: :high, description: "higher than average", min:4, max:8},
                          little_high: {class: :little_high, description: "a little higher than average", min:2, max:4},
                          average: {class: :average, description: "roughly average", min:-2, max:2},
                          little_low: {class: :little_low, description: "a little lower than average", min:-4, max:-2},
                          low: {class: :low, description: "lower than average", min:-8, max:-4},
                          very_low: {class: :very_low, description: "much lower than average", min:nil, max:-8}}

  WAGE_CLASS = {very_high: {class: :very_high, description: "much higher than average", min:100, max:nil},
                high: {class: :high, description: "higher than average", min:40, max:100},
                little_high: {class: :little_high, description: "a little higher than average", min:20, max:40},
                average: {class: :average, description: "roughly average", min:-20, max:20},
                little_low: {class: :little_low, description: "a little lower than average", min:-40, max:-20},
                low: {class: :low, description: "lower than average", min:-100, max:-40},
                very_low: {class: :very_low, description: "much lower than average", min:nil, max:-100}}

  # Add '+' on front of positive numbers, leave 0 with nothing, negatives will already get '-'
  def self.percent_change_to_s(swing)
    return "Unknown" if (swing.nil? || swing == "")

    begin
      (Float(swing) > 0) ? "+" + swing.to_s : swing.to_s
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

  def self.classify_statistic(stat, classifications)
    classify_statistic_compared_with(stat, 0, classifications)
  end

  def self.classify_statistic_compared_with(stat, compare_stat, classifications)
    return nil if stat.nil? || compare_stat.nil?

    classifications.each do |name, classification|
      if classification[:max].nil? then
        return classification if stat > compare_stat + classification[:min]
      elsif classification[:min].nil?
        return classification if stat < compare_stat + classification[:max]
      else
        return classification if stat.between?(compare_stat + classification[:min], compare_stat + classification[:max])
      end
    end
  end

  def self.classify_statistic_to_s(stat_description, stat_method, area_summary, compare_to_area_summary, classifications)
    stat = area_summary.public_send(stat_method)
    compare_stat = compare_to_area_summary.public_send(stat_method)
    classification = classify_statistic_compared_with(stat, compare_stat, classifications)
    compare_area_name = compare_to_area_summary.area.name

    return nil if classification.nil?

    "#{stat_description} is #{classification[:description]} for #{compare_area_name}, at #{stat.round(2)} (Average for #{compare_area_name} is #{compare_stat.round(2)})"
  end

end
