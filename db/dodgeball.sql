


CREATE TABLE teams(
  id SERIAL4 primary key,
  name VARCHAR(255)
);

CREATE TABLE match(
  id SERIAL4 primary key,
  home_team_id INT4 references teams( id ),
  away_team_id INT4 references teams( id ),
  home_team_score INT4,
  away_team_score INT4
);





