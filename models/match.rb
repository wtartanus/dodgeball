#####Match
###Should have: id, away team, home team
###Should do: play game, list all match, list all match according to team

class Match


  attr_accessor :id, :home_team_id, :away_team_id, :home_team_score, 
                :away_team_score


   def initialize( options )
    @id = options[ 'id' ].to_i
    @home_team_id = options[ 'home_team_id' ].to_i
    @away_team_id = options[ 'away_team_id' ].to_i
    @home_team_score = options[ 'home_team_score' ].to_i
    @away_team_score = options[ 'away_team_score' ].to_i 
   end

   def save()
     sql = "INSERT INTO 
     match(home_team_id, away_team_id, home_team_score, away_team_score) VALUES(#{@home_team_id}, #{@away_team_id}, #{@home_team_score}, 
       #{@away_team_score}) RETURNING *"
     match = Match.map_item( sql )

     return match
   end

   def self.all()
     sql = "SELECT * FROM match"
     match = Match.map_items( sql )

     return match
   end


   def self.map_items( sql )
     games = SqlRunner.run( sql )
     result = games.map { |match| Match.new( match )}

     return result
   end

   def self.map_item( sql )
     match = Match.map_items( sql )
     match = match.first

     return match
   end

   def self.delete_all()
     sql = "DELETE FROM match"
     SqlRunner.run( sql )
   end

end