#!/bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change the code above this line. Use the PSQL variable above to query your database.

echo "Clearing existing data from games and teams tables..."
echo "$($PSQL "TRUNCATE TABLE games, teams")"

cat games.csv | while IFS="," read -r year round winner opponent winner_goals opponent_goals
do
  # Skip the first line (headers)
  if [[ $year != "year" ]]
  then
    # Get winner_id
    winner_id="$($PSQL "SELECT team_id FROM teams AS t WHERE t.name = '$winner'")"

    # If the winner team doesn't exist in the teams table
    if [[ -z $winner_id ]]
    then
      # Insert the winner team into the teams table
      echo "Inserting winner team: $winner into the teams table..."
      echo "$($PSQL "INSERT INTO teams(name) VALUES('$winner')")"
      
      # Get the newly inserted winner_id
      winner_id="$($PSQL "SELECT team_id FROM teams AS t WHERE t.name = '$winner'")"
      echo "Winner team $winner inserted with team_id: $winner_id"
    fi

    # Get opponent_id
    opponent_id="$($PSQL "SELECT team_id FROM teams AS t WHERE t.name = '$opponent'")"

    # If the opponent team doesn't exist in the teams table
    if [[ -z $opponent_id ]]
    then
      # Insert the opponent team into the teams table
      echo "Inserting opponent team: $opponent into the teams table..."
      echo "$($PSQL "INSERT INTO teams(name) VALUES('$opponent')")"

      # Get the newly inserted opponent_id
      opponent_id="$($PSQL "SELECT team_id FROM teams AS t WHERE t.name = '$opponent'")"
      echo "Opponent team $opponent inserted with team_id: $opponent_id"
    fi

    # Insert the match into the games table
    echo "Inserting match: $winner vs $opponent into the games table..."
    echo "$($PSQL "INSERT INTO games(year, winner_id, opponent_id, winner_goals, opponent_goals, round) VALUES($year, $winner_id, $opponent_id, $winner_goals, $opponent_goals, '$round')")"
    echo "Match inserted: $winner ($winner_goals) vs $opponent ($opponent_goals) in the $round round of $year"
  fi
done
