require( 'pg' )
require( 'pry-byebug' )
require_relative( 'db/sql_runner.rb' )
require_relative( 'models/team.rb' )
require_relative( 'models/match.rb' )

Team.delete_all()
Match.delete_all()

team1 = Team.new( { 'name' => 'Wizards'} )
team2 = Team.new( { 'name' => 'Heat'} )
team3 = Team.new( { 'name' => 'Magic'} )
team4 = Team.new( { 'name' => 'Lakers'} )
team5 = Team.new( { 'name' => 'Bulls'} )

t1 = team1.save()
t2 = team2.save()
t3 = team3.save()
t4 = team4.save()
t5 = team5.save()

match1 = Match.new( { 'home_team_id' => t1.id, 'away_team_id' => t2.id, 'home_team_score' => 0, 
                      'away_team_score' => 3 } )
match2 = Match.new( { 'home_team_id' => t3.id, 'away_team_id' => t4.id, 'home_team_score' => 2, 
                      'away_team_score' => 1 } )
match3 = Match.new( { 'home_team_id' => t5.id, 'away_team_id' => t1.id, 'home_team_score' => 0, 
                      'away_team_score' => 4 } )
match4 = Match.new( { 'home_team_id' => t2.id, 'away_team_id' => t1.id, 'home_team_score' => 1, 
                      'away_team_score' => 3 } )

m1 = match1.save()
m2 = match2.save()
m3 = match3.save()
m4 = match4.save()

binding.pry
nil