require 'csv'

puts "Creating Ward Population Estimates"

arr_of_arrs = CSV.read(File.join(Rails.root, 'db', 'seeds', 'csv_data', '14_ward_population_estimates.csv'))

header_row = arr_of_arrs[0]

arr_of_arrs[1,arr_of_arrs.size-1].each_with_index do |row,i|

  # Ensure all data is numeric, aside from 1st 2 cols
  # (ward_id and estimate_description)
  (2..row.size-1).each do |i|
    row[i] = Integer(row[i].gsub(/,/, ""))
  end

  parameter_hash = header_row.zip(row).to_h
  parametr_hash[:estimate_date] = Date.new(2015,6,1)
  WardPopulationEstimate.create!(parameter_hash)

end
