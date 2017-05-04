
puts "Creating GE2015 Contituency Election"

Constituency.all.each do |constituency|
  ConstituencyElection.create!(
      constituency_id: constituency.id,
      election_type: "General Election", election_sub_type: "",
      election_date: Date.new(2017,6,8))
end
