class ConstituenciesController < ApplicationController
  def index
    @page = :reports

    @og = {}
    @og[:title] = 'The Rebel Alliance: Constituencies'
    @og[:description] = "Find out more about the constituencies in this election."
    @og[:image] = nil

    @constituencies = Constituency.includes(:region, :area_summary, most_recent_election_result: :constituency_election_summary).all.to_a

    if (params[:p18_34]) then
      puts "filtering constituencies based on youth vote"
      filter_youth_vote!(@constituencies, params[:p18_34].to_f)
    end

    if (params[:marginal]) then
      puts "Filtering constituencies based on marginals"
      filter_marginal!(@constituencies, params[:marginal].to_f)
    end
  end

  def show
    @page = :reports

    @constituency = Constituency.find_by(id: params[:id])

    @og = {}
    @og[:title] = "The Rebel Alliance: #{@constituency.name}"
    @og[:description] = "Find out more about #{@constituency.name}."
    @og[:image] = nil
  end


  private
    def filter_youth_vote!(constituencies, youth_vote_above_avg)
      constituencies.select! do |c|
        diff_avg = c.area_summary.pop_18_34_diff_avg
        !diff_avg.nil? && diff_avg > youth_vote_above_avg
      end
    end

    def filter_marginal!(constituencies, swing)
      constituencies.select! do |c|
        election = c.most_recent_election_result.summary
        puts "#{c.name}"

        return_value = false
        # Conservative seat, ProgAlly 2nd, within swing
        if (election.party_1_id == 'CON' && election.party_1_ahead_behind_percent < swing && ['LAB', 'LD', 'GRN', 'SNP', 'PC'].include?(election.party_2_id)) then
          puts "Conservative lead, #{election.party_2_id} within #{swing}"
          return_value = true
        end
        # ProgAlly seat, Conservatives within swing, or Conservatives + UKIP more than incumbant
        if (['LAB', 'LD', 'GRN', 'SNP', 'PC'].include?(election.party_1_id) && (election.party_1_vote_share_percent - election.con_vote_share_percent < swing || election.con_votes + election.ukip_votes > election.party_1_votes)) then
          puts "ProgAlly lead (#{election.party_1_id}), Conservatives within #{swing} or Conservative + UKPI (#{election.con_votes} + #{election.ukip_votes}) more than #{election.party_1_votes}"
          return_value = true
        end

        return_value
      end
    end
end
