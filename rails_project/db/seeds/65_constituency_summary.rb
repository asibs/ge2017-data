
puts "Creating Contituency Summaries"


Constituency.all.each do |c|
  args_hash = {}
  args_hash[:constituency] = c
  args_hash[:constituency_name] = c.name
  args_hash[:constituency_region] = c.region.name
  args_hash[:constituency_country] = c.country.id

  # Previous Election data
  last_election = c.elections_with_results.first

  args_hash[:prev_election_date] = last_election.election_date
  args_hash[:prev_election_type] = last_election.election_type
  args_hash[:prev_election_electorate_size] = last_election.electorate_size
  args_hash[:prev_election_turnout_percent] = (last_election.total_valid_votes_counted.to_f / last_election.electorate_size) * 100
  args_hash[:prev_election_postal_percent] = (last_election.valid_postal_votes_counted.to_f / last_election.total_valid_votes_counted) * 100


  # Previous Election Rankings
  last_election_rank = last_election.result.party_rank
  (1..5).each do |i|
    party = last_election_rank.public_send("party_#{i}_id")
    if !party.nil? then
      args_hash["party_#{i}_id"] = party
      args_hash["party_#{i}_votes"] = last_election_rank.public_send("party_#{i}_votes")
      args_hash["party_#{i}_vote_share_percent"] = last_election_rank.public_send("party_#{i}_vote_share_percent")

      ahead_behind = ( if i == 1
                       then last_election_rank.party_1_votes - last_election_rank.party_2_votes
                       else last_election_rank.public_send("party_#{i}_votes_behind") * -1
                       end )

      args_hash["party_#{i}_ahead_behind"] = ahead_behind
      args_hash["party_#{i}_ahead_behind_percent"] = (ahead_behind.to_f / last_election.total_valid_votes_counted) * 100
    end
  end

  # Previous Election Major Party info
  major_parties = ["CON", "LAB", "LD", "GRN", "UKIP", "SNP", "PC"]
  votes = last_election.actual_votes.to_a.sort { |a,b| b.votes <=> a.votes }
  (0..votes.size-1).each do |i|
    party = votes[i].party.id
    if major_parties.include?(party) then
      args_hash["#{party}_position"] = i+1
      args_hash["#{party}_votes"] = votes[i].votes
      args_hash["#{party}_vote_share_percent"] = votes[i].vote_share_percent

      ahead_behind = ( if i == 0
                       then votes[0].votes - votes[1].votes
                       else votes[i].votes - votes[0].votes
                       end )

      args_hash["#{party}_ahead_behind"] = ahead_behind
      args_hash["#{party}_ahead_behind_percent"] = (ahead_behind.to_f / last_election.total_valid_votes_counted) * 100

      # Sanity checks
      if i <= 4 then
        if (args_hash["#{party}_ahead_behind"] != args_hash["party_#{i+1}_ahead_behind"]) then
          puts "Constituency #{c.name} - Party #{party} 'ahead / behind' is unequal"
          p args_hash["#{party}_ahead_behind"]
          p args_hash["party_#{i+1}_ahead_behind"]
        end
        if ((args_hash["#{party}_ahead_behind_percent"] - args_hash["party_#{i+1}_ahead_behind_percent"]).abs > 0.1) then
          puts "Constituency #{c.name} - Party #{party} 'ahead / behind percent' is unequal"
          p args_hash["#{party}_ahead_behind_percent"]
          p args_hash["party_#{i+1}_ahead_behind_percent"]
        end
      end

    end
  end

  # EU Referendum vote
  eu_vote = c.eu_vote
  if !eu_vote.nil? then
    args_hash[:eu_ref_leave_vote_percent] = eu_vote.leave_vote_percent
  end

  # Population Estimates
  last_pop_est = c.population_estimates.first
  if !last_pop_est.nil? then
    args_hash[:pop_estimate_date] = last_pop_est.estimate_date
    args_hash[:pop_total] = last_pop_est.pop_total
    args_hash[:pop_total_f] = last_pop_est.pop_total_f
    args_hash[:pop_total_m] = last_pop_est.pop_total_m

    args_hash[:pop_0_17] = last_pop_est.population(min_age:0, max_age:17)
    args_hash[:pop_0_17_percent] = last_pop_est.population_percentage(min_age:0, max_age:17)

    args_hash[:pop_18_34] = last_pop_est.population(min_age:18, max_age:34)
    args_hash[:pop_18_34_percent] = last_pop_est.population_percentage(min_age:18, max_age:34)

    args_hash[:pop_35_49] = last_pop_est.population(min_age:35, max_age:49)
    args_hash[:pop_35_49_percent] = last_pop_est.population_percentage(min_age:35, max_age:49)

    args_hash[:pop_50_64] = last_pop_est.population(min_age:50, max_age:64)
    args_hash[:pop_50_64_percent] = last_pop_est.population_percentage(min_age:50, max_age:64)

    args_hash[:pop_65_plus] = last_pop_est.population(min_age:65, max_age: 90)
    args_hash[:pop_65_plus_percent] = last_pop_est.population_percentage(min_age:65, max_age:90)
  end


  # Unemployment
  last_unemployment_stat = c.unemployment_rates.first
  if !last_unemployment_stat.nil? then
    args_hash[:unemployment_date] = last_unemployment_stat.statistic_date
    args_hash[:unemployment_count] = last_unemployment_stat.unemployed_count
    args_hash[:unemployemnt_percent] = last_unemployment_stat.unemployed_percent
  end

  # Youth Unemployment
  last_youth_unemployment_stat = c.youth_unemployment_rates.first
  if !last_youth_unemployment_stat.nil? then
    args_hash[:youth_unemployment_date] = last_youth_unemployment_stat.statistic_date
    args_hash[:youth_unemployment_count] = last_youth_unemployment_stat.youth_unemployed_count
    args_hash[:youth_unemployemnt_percent] = last_youth_unemployment_stat.youth_unemployed_percent
  end

  # Out of Work Benefits
  last_oow_benefit_stat = c.out_of_work_benefit_rates.first
  if !last_oow_benefit_stat.nil? then
    args_hash[:oow_benefits_date] = last_oow_benefit_stat.statistic_date
    args_hash[:oow_benefits_count] = last_oow_benefit_stat.oow_benefits_count
    args_hash[:oow_benefits_percent] = last_oow_benefit_stat.oow_benefits_percent
  end

  # Incapacity Benefits
  last_incap_benefit_stat = c.incapacity_benefit_rates.first
  if !last_incap_benefit_stat.nil? then
    args_hash[:incapacity_benefits_date] = last_incap_benefit_stat.statistic_date
    args_hash[:incapacity_benefits_count] = last_incap_benefit_stat.incapacity_benefits_count
    args_hash[:incapacity_benefits_percent] = last_incap_benefit_stat.incapacity_benefits_percent
  end

  # Youth Unemployment
  last_wage_stat = c.median_wages.first
  if !last_wage_stat.nil? then
    args_hash[:median_wage_date] = last_wage_stat.statistic_date
    args_hash[:median_wage] = last_wage_stat.median_wage
  end

  ConstituencySummary.create!(args_hash)
end
