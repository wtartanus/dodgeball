class League

attr_accessor :match

  def initialize( match )
    @match = match
  end




  def most_win()
     winners = []
     winners_hash = Hash.new(0)
     

     for match in @match
       if match.away_team_score > match.home_team_score
         winners << match.away_team_id
        elsif match.away_team_score < match.home_team_score
          winners << match.home_team_id
       end
     end
     
    

    winners.each { | v | winners_hash.store(v, winners_hash[v]+1) }

    teams_win_count = winners_hash.values
    max_win_number = teams_win_count.max
    max_win_number_index = teams_win_count.rindex(max_win_number)

    winners_id = winners_hash.keys

    team_id = winners_id[max_win_number_index]

    sql = "Select * FROM teams WHERE id = #{team_id}"

    team =  Team.map_item( sql )

    txt = " Most wins has #{team.name} with #{max_win_number} won games."

    return txt

      
  end

  def min_win

      loosers = []
      winners = []
      teams = []


      for match in @match
        if match.away_team_score > match.home_team_score
          winners << match.away_team_id
         elsif match.away_team_score < match.home_team_score
           winners << match.home_team_id
        end
      end

      for match in @match
        if match.away_team_score > match.home_team_score
          loosers << match.home_team_id
         elsif match.away_team_score < match.home_team_score
           loosers << match.away_team_id
        end
      end

      min_win_teams = loosers - winners

      for id in min_win_teams
        sql = " SELECT * FROM teams WHERE id = #{id}"
        teams << Team.map_item( sql )
      end
  
      return teams


  end


  def all
    
    loosers = []
    winners = []

    teams_array = Team.all()
    teams = []

    for team in teams_array
      teams << {name: team.name, team_id: team.id, win: 0, loose: 0}
    end

   

    for match in @match
      if match.away_team_score > match.home_team_score
        winners << match.away_team_id
       elsif match.away_team_score < match.home_team_score
         winners << match.home_team_id
      end
    end

    for match in @match
      if match.away_team_score > match.home_team_score
        loosers << match.home_team_id
       elsif match.away_team_score < match.home_team_score
         loosers << match.away_team_id
      end
    end

 
   for id in winners
    for index in teams
     if index[:team_id] == id
      index[:win] += 1
     end
    end
   end

   for id in loosers
    for index in teams
     if index[:team_id] == id
      index[:loose] += 1
     end
    end
   end

   return teams
  end


end





















