# Only have constituency / ward estimates for England & Wales so far...

puts "Creating Country Population Estimates"

totals = { "England" => Hash.new(0), "Wales" => Hash.new(0) }

ConstituencyPopulationEstimate.where(estimate_description: "ONS 2015 estimates").each do |constituency_pop_est|

  country = constituency_pop_est.constituency.country.id
  if totals.keys.include?(country) then
    totals[country]["pop_total"] += constituency_pop_est.public_send("pop_total")
    totals[country]["pop_total_f"] += constituency_pop_est.public_send("pop_total_f")
    totals[country]["pop_total_m"] += constituency_pop_est.public_send("pop_total_m")

    (0..89).each do |i|
      totals[country]["pop_#{i}_f"] += constituency_pop_est.public_send("pop_#{i}_f")
      totals[country]["pop_#{i}_m"] += constituency_pop_est.public_send("pop_#{i}_m")
    end
    totals[country]["pop_90plus_f"] += constituency_pop_est.public_send("pop_90plus_f")
    totals[country]["pop_90plus_m"] += constituency_pop_est.public_send("pop_90plus_m")
  end
end

totals.each do |key,val|
  # Add extra data so we can use this hash for creating the Country Population Estimate
  val[:country_id] = key
  val[:estimate_date] = Date.new(2015,6,1)
  val[:estimate_description] = "ONS 2015 estimates"
  CountryPopulationEstimate.create!(val)
end
