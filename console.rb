require( 'pg' )
require( 'pry-byebug' )
require_relative( 'db/sql_runner.rb' )
require_relative( 'models/team.rb' )
require_relative( 'models/team.rb' )

Team.delete_all()

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

binding.pry
nil