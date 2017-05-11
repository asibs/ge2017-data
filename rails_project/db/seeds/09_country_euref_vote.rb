# Origianl data from:
# http://www.bbc.co.uk/news/politics/eu_referendum/results


puts "#{Time.now.strftime("%d/%m/%Y %H:%M:%S")} - Creating Country EU Votes"

AreaEuVote.create!(area: Country.find('England'), actual_leave_votes: 15188406, actual_remain_votes: 13266996, actual_leave_vote_percent: 53.3761779222, contains_postal_votes: false)
AreaEuVote.create!(area: Country.find('Wales'), actual_leave_votes: 854572, actual_remain_votes: 772347, actual_leave_vote_percent: 52.5270157887, contains_postal_votes: false)
AreaEuVote.create!(area: Country.find('Scotland'), actual_leave_votes: 1018322, actual_remain_votes:  1661191, actual_leave_vote_percent: 38.0039955022, contains_postal_votes: false)
AreaEuVote.create!(area: Country.find('Northern Ireland'), actual_leave_votes: 349442, actual_remain_votes: 440707, actual_leave_vote_percent: 44.2248234194, contains_postal_votes: false)
