puts "#{Time.now.strftime("%d/%m/%Y %H:%M:%S")} - Creating States / Countries"

# UK is a 'soveriegn state' made up of 4 constituent 'countries'
uk = State.create!(id: 'UK')

Country.create!(id: 'England', state: uk)
Country.create!(id: 'Northern Ireland', state: uk)
Country.create!(id: 'Scotland', state: uk)
Country.create!(id: 'Wales', state: uk)
