
puts "#{Time.now.strftime("%d/%m/%Y %H:%M:%S")} - Creating Area Summaries"

def diff(area_number, parent_number)
  return nil if area_number.nil? || parent_number.nil?
  area_number - parent_number
end

areas = []
areas.concat(Ward.all.to_a)
areas.concat(Constituency.all.to_a)
areas.concat(Region.all.to_a)
areas.concat(Country.all.to_a)
areas.concat(State.all.to_a)


i = 0
loop do
  area = areas.pop
  break if area.nil?
  i += 1

  args_hash = {}

  # Basic data
  args_hash[:area] = area
  args_hash[:area_name] = area.name

  # EU Referendum vote
  eu_vote = area.eu_vote
  if !eu_vote.nil? then
    args_hash[:eu_ref_leave_vote_percent] = eu_vote.leave_vote_percent
  end

  # Population Estimates
  last_pop_est = area.population_estimates.first
  if !last_pop_est.nil? then
    args_hash[:pop_estimate_date] = last_pop_est.estimate_date
    args_hash[:pop_total] = last_pop_est.pop_total

    args_hash[:pop_total_f] = last_pop_est.pop_total_f
    args_hash[:pop_total_f_percent] = last_pop_est.population_percentage(gender: :f)

    args_hash[:pop_total_m] = last_pop_est.pop_total_m
    args_hash[:pop_total_m_percent] = last_pop_est.population_percentage(gender: :m)

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
  last_unemployment_stat = area.unemployment_rates.first
  if !last_unemployment_stat.nil? then
    args_hash[:unemployment_date] = last_unemployment_stat.statistic_date
    args_hash[:unemployment_count] = last_unemployment_stat.unemployed_count
    args_hash[:unemployemnt_percent] = last_unemployment_stat.unemployed_percent
  end

  # Youth Unemployment
  last_youth_unemployment_stat = area.youth_unemployment_rates.first
  if !last_youth_unemployment_stat.nil? then
    args_hash[:youth_unemployment_date] = last_youth_unemployment_stat.statistic_date
    args_hash[:youth_unemployment_count] = last_youth_unemployment_stat.youth_unemployed_count
    args_hash[:youth_unemployemnt_percent] = last_youth_unemployment_stat.youth_unemployed_percent
  end

  # Out of Work Benefits
  last_oow_benefit_stat = area.out_of_work_benefit_rates.first
  if !last_oow_benefit_stat.nil? then
    args_hash[:oow_benefits_date] = last_oow_benefit_stat.statistic_date
    args_hash[:oow_benefits_count] = last_oow_benefit_stat.oow_benefits_count
    args_hash[:oow_benefits_percent] = last_oow_benefit_stat.oow_benefits_percent
  end

  # Incapacity Benefits
  last_incap_benefit_stat = area.incapacity_benefit_rates.first
  if !last_incap_benefit_stat.nil? then
    args_hash[:incapacity_benefits_date] = last_incap_benefit_stat.statistic_date
    args_hash[:incapacity_benefits_count] = last_incap_benefit_stat.incapacity_benefits_count
    args_hash[:incapacity_benefits_percent] = last_incap_benefit_stat.incapacity_benefits_percent
  end

  # Median Wages
  last_wage_stat = area.median_wages.first
  if !last_wage_stat.nil? then
    args_hash[:median_wage_date] = last_wage_stat.statistic_date
    args_hash[:median_wage] = last_wage_stat.median_wage
  end


  area_type = area.area_type
  if area_type == "Constituency" || area_type == "Ward" then
    country_summary = area.country.area_summary
    args_hash[:pop_total_f_diff_avg] = diff(args_hash[:pop_total_f_percent], country_summary.pop_total_f_percent)
    args_hash[:pop_total_m_diff_avg] = diff(args_hash[:pop_total_m_percent], country_summary.pop_total_m_percent)
    args_hash[:pop_0_17_diff_avg] = diff(args_hash[:pop_0_17_percent], country_summary.pop_0_17_percent)
    args_hash[:pop_18_34_diff_avg] = diff(args_hash[:pop_18_34_percent], country_summary.pop_18_34_percent)
    args_hash[:pop_35_49_diff_avg] = diff(args_hash[:pop_35_49_percent], country_summary.pop_35_49_percent)
    args_hash[:pop_50_64_diff_avg] = diff(args_hash[:pop_50_64_percent], country_summary.pop_50_64_percent)
    args_hash[:pop_65_plus_diff_avg] = diff(args_hash[:pop_65_plus_percent], country_summary.pop_65_plus_percent)

    region_summary = area.region.area_summary
    args_hash[:unemployemnt_diff_avg] = diff(args_hash[:unemployemnt_percent], region_summary.unemployemnt_percent)
    args_hash[:youth_unemployemnt_diff_avg] = diff(args_hash[:youth_unemployemnt_percent], region_summary.youth_unemployemnt_percent)
    args_hash[:oow_benefits_diff_avg] = diff(args_hash[:oow_benefits_percent], region_summary.oow_benefits_percent)
    args_hash[:incapacity_benefits_diff_avg] = diff(args_hash[:incapacity_benefits_percent], region_summary.incapacity_benefits_percent)
    args_hash[:median_wage_diff_avg] = diff(args_hash[:median_wage], region_summary.median_wage)
  end

  AreaSummary.create!(args_hash)
end
