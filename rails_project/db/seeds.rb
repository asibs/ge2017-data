# Seed data is separated out into separate files - db/seeds/<nn>_<my_seed_data>.rb
#
# Individual files can be run using db:seed:my_seed_data (see /lib/tasks/custom_seed.rake)
#
# This file (run with the standard db:seed job) will load all individual files and
# run them in alphabetical order (therefore seed files should have a numeric prefix)


seeds = Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].select do |filepath|
  seed_no = filepath.split("/").last[0..1].sub(/^[0]*([0-9]{1,})$/, '\1')
  Integer(seed_no) rescue false
end

seeds.sort.each do |seed|
  puts "Loading #{seed}"
  load seed
end
