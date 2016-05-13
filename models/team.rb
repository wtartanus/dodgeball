######Team
###Should have: id, name |players,win,lost,defence,offensive|
###Should do: create team,delete team, update team,list all teams, list one team, delete all teams

class Team

attr_accessor :id, :name

      def initialize( options )
        @id = options[ 'id' ].to_i
        @name = options[ 'name' ]
      end

      def save()
        sql = "INSERT INTO teams(name) VALUES('#{@name}') RETURNING *"
        team = Team.map_item( sql )

        return team
      end

      def self.all()
        sql = "SELECT * FROM teams"
        teams = Team.map_items( sql )

        return teams
      end

      def update()
       sql = "UPDATE teams SET name = '#{@name}'
         WHERE id = #{@id}"

       SqlRunner.run( sql )

      end

      def self.map_items( sql )
        teams = SqlRunner.run( sql )
        result = teams.map { |team| Team.new( team )}

        return result
      end

      def self.map_item( sql )
        team = Team.map_items( sql )
        team = team.first

        return team
      end

      def self.delete_all()
        sql = "DELETE FROM teams"
        SqlRunner.run( sql )
      end

end