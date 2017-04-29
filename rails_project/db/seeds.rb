# Seed data is separated out into separate files - db/seeds/<nn>_<my_seed_data>.rb
#
# Individual files can be run using db:seed:my_seed_data (see /lib/tasks/custom_seed.rake)
#
# This file (run with the standard db:seed job) will load all individual files and
# run them in alphabetical order (therefore seed files should have a numeric prefix)


Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }
