# Reserve seed files starting 00-49 for raw data files

seeds = Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].select do |filepath|
  seed_no = filepath.split("/").last[0..1].sub(/^[0]*([0-9]{1,})$/, '\1')
  Integer(seed_no) < 50 rescue false
end

seeds.sort.each do |seed|
  puts "Loading #{seed}"
  load seed
end
