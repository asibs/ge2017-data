require 'csv'

puts "Creating Contituency Population Estimates"

arr_of_arrs = CSV.read(File.join(Rails.root, 'db', 'seeds', 'csv_data', '13_constituency_population_estimates.csv'))

header_row = arr_of_arrs[0]

arr_of_arrs[1,arr_of_arrs.size].each do |row|

  # Ensure all data is numeric, aside from 1st 2 cols
  # (constituency_id and estimate_description)
  (2..row.size-1).each do |i|
    row[i] = Integer(row[i].gsub(/,/, ""))
  end

  parameter_hash = header_row.zip(row).to_h
  parameter_hash[:estimate_date] = Date.new(2015,6,1)
  ConstituencyPopulationEstimate.create!(parameter_hash)

end
