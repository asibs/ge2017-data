# Original data from:
# https://public.tableau.com/profile/house.of.commons.library.statistics#!/vizhome/Outofworkbenefits/Data

puts "#{Time.now.strftime("%d/%m/%Y %H:%M:%S")} - Creating State Out Of Work Benefit Rates"

AreaOutOfWorkBenefit.create!(area: State.find('UK'), statistic_date: '2010-05-01', oow_benefits_count: 4828350, oow_benefits_percent: 12.2)
AreaOutOfWorkBenefit.create!(area: State.find('UK'), statistic_date: '2010-08-01', oow_benefits_count: 4809530, oow_benefits_percent: 12.2)
AreaOutOfWorkBenefit.create!(area: State.find('UK'), statistic_date: '2010-11-01', oow_benefits_count: 4745300, oow_benefits_percent: 12)
AreaOutOfWorkBenefit.create!(area: State.find('UK'), statistic_date: '2011-02-01', oow_benefits_count: 4812650, oow_benefits_percent: 12.1)
AreaOutOfWorkBenefit.create!(area: State.find('UK'), statistic_date: '2011-05-01', oow_benefits_count: 4746910, oow_benefits_percent: 11.9)
AreaOutOfWorkBenefit.create!(area: State.find('UK'), statistic_date: '2011-08-01', oow_benefits_count: 4830460, oow_benefits_percent: 12.1)
AreaOutOfWorkBenefit.create!(area: State.find('UK'), statistic_date: '2011-11-01', oow_benefits_count: 4800770, oow_benefits_percent: 12.1)
AreaOutOfWorkBenefit.create!(area: State.find('UK'), statistic_date: '2012-02-01', oow_benefits_count: 4890930, oow_benefits_percent: 12.3)
AreaOutOfWorkBenefit.create!(area: State.find('UK'), statistic_date: '2012-05-01', oow_benefits_count: 4745030, oow_benefits_percent: 11.9)
AreaOutOfWorkBenefit.create!(area: State.find('UK'), statistic_date: '2012-08-01', oow_benefits_count: 4684230, oow_benefits_percent: 11.8)
AreaOutOfWorkBenefit.create!(area: State.find('UK'), statistic_date: '2012-11-01', oow_benefits_count: 4600620, oow_benefits_percent: 11.6)
AreaOutOfWorkBenefit.create!(area: State.find('UK'), statistic_date: '2013-02-01', oow_benefits_count: 4637550, oow_benefits_percent: 11.7)
AreaOutOfWorkBenefit.create!(area: State.find('UK'), statistic_date: '2013-05-01', oow_benefits_count: 4467090, oow_benefits_percent: 11.2)
AreaOutOfWorkBenefit.create!(area: State.find('UK'), statistic_date: '2013-08-01', oow_benefits_count: 4336860, oow_benefits_percent: 10.9)
AreaOutOfWorkBenefit.create!(area: State.find('UK'), statistic_date: '2013-11-01', oow_benefits_count: 4208130, oow_benefits_percent: 10.6)
AreaOutOfWorkBenefit.create!(area: State.find('UK'), statistic_date: '2014-02-01', oow_benefits_count: 4215690, oow_benefits_percent: 10.6)
AreaOutOfWorkBenefit.create!(area: State.find('UK'), statistic_date: '2014-05-01', oow_benefits_count: 4044910, oow_benefits_percent: 10.1)
AreaOutOfWorkBenefit.create!(area: State.find('UK'), statistic_date: '2014-08-01', oow_benefits_count: 3956690, oow_benefits_percent: 9.9)
AreaOutOfWorkBenefit.create!(area: State.find('UK'), statistic_date: '2014-11-01', oow_benefits_count: 3853300, oow_benefits_percent: 9.7)
AreaOutOfWorkBenefit.create!(area: State.find('UK'), statistic_date: '2015-02-01', oow_benefits_count: 3876520, oow_benefits_percent: 9.7)
AreaOutOfWorkBenefit.create!(area: State.find('UK'), statistic_date: '2015-05-01', oow_benefits_count: 3749490, oow_benefits_percent: 9.4)
AreaOutOfWorkBenefit.create!(area: State.find('UK'), statistic_date: '2015-08-01', oow_benefits_count: 3679140, oow_benefits_percent: 9.2)
AreaOutOfWorkBenefit.create!(area: State.find('UK'), statistic_date: '2015-11-01', oow_benefits_count: 3592300, oow_benefits_percent: 9)
AreaOutOfWorkBenefit.create!(area: State.find('UK'), statistic_date: '2016-02-01', oow_benefits_count: 3592920, oow_benefits_percent: 9)
