----1.View the first 100 rows of the dataset to understand its structure

select top 100 * from [LIZA].[dbo].[ketro_sa_soccer_dataset_advanced]

-----2. Count the total number of players in the dataset. 

select * from [LIZA].[dbo].[ketro_sa_soccer_dataset_advanced]

select count (*) as Total_players
from [LIZA].[dbo].[ketro_sa_soccer_dataset_advanced]

-----3. List all unique teams in the league. 

select distinct team
from [LIZA].[dbo].[ketro_sa_soccer_dataset_advanced]

-----4. Count how many players are in each team. 
select team, count(*) as player_count
from[LIZA]. [dbo].[ketro_sa_soccer_dataset_advanced]
group by team;


-----5. Identify the top 10 players with the most goals. 
select top 10 player_name, goals 
from [LIZA].[dbo].[ketro_sa_soccer_dataset_advanced]
order by goals DESC;

-----6. Find the average salary for players in each team.

SELECT 
    player_name,
    team,
    AVG(cast(average_salary_zar as float)) AS avg_salary

FROM [LIZA].[dbo].[ketro_sa_soccer_dataset_advanced]
group by team, player_name;



-----7. Retrieve the top 10 players with the highest market value.

select top 10 player_name, market_value_zar
from [LIZA].[dbo].[ketro_sa_soccer_dataset_advanced]
order by market_value_zar desc;

-----8. Calculate the average passing accuracy for each position.

select position, count(*) as avg_passing_accuracy
from [LIZA].[dbo].[ketro_sa_soccer_dataset_advanced]
group by position;

-----9. Compare shot accuracy with goals to find correlations.
-----10. Compute total goals and assists for each team.
SELECT 
    team,
    SUM(cast(goals as int)) AS total_goals,
    SUM(cast(assists as int)) AS total_assists
FROM [LIZA].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY team;
-----11. Count players by their marital status.
 SELECT
    marital_status,
   COUNT(*) as total_player
FROM [LIZA].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY marital_status;
-----12. Count players by nationality.
 SELECT
    nationality,
   COUNT(*) as total_player
FROM [LIZA].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY nationality;

 ----13. Find average market value grouped by nationality.
  SELECT 
    nationality,
    AVG(cast(market_value_zar as float)) AS avg_market_value

FROM [LIZA].[dbo].[ketro_sa_soccer_dataset_advanced]
group by nationality;
 ----14. Determine how many player contracts end in each year. 
  SELECT
    contract_end_year,
   COUNT(distinct player_name) as numberofplayer
FROM [LIZA].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY contract_end_year;
-----15. Identify players whose contracts end next year.
  SELECT player_name
FROM [LIZA].[dbo].[ketro_sa_soccer_dataset_advanced]
WHERE contract_end_year = 2026;
 ----16. Summarize the number of players by injury status.

select injury_status,
   COUNT(distinct player_name) as numberofplayer
FROM [LIZA].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY injury_status;

-----17. Calculate goals per match ratio for each player.
  SELECT player_name,goals,matches_played,
 CAST(goals AS FLOAT) / NULLIF(matches_played, 0) AS goals_per_match
FROM [LIZA].[dbo].[ketro_sa_soccer_dataset_advanced];

-----18. Count how many players are managed by each agent.
 SELECT
    Agent,
    COUNT(Player_name) AS NumberOfPlayers
 FROM [LIZA].[dbo].[ketro_sa_soccer_dataset_advanced]
Group by agent
ORDER BY NumberOfPlayers DESC;

 ----19. Calculate average height and weight by player position.
  SELECT 
     Position,
    AVG(Height_cm) AS Average_Height,
    AVG (Weight_kg) AS AverageWeight,
    COUNT(*) AS NumberOfPlayers
FROM [LIZA].[dbo].[ketro_sa_soccer_dataset_advanced]
GROUP BY POSITION
ORDER BY Position;
 ----20. Identify players with the highest combined goals and assists.

 SELECT top 5 player_name,
    goals,
    assists,
    (goals + assists) AS total_contributions

FROM [LIZA].[dbo].[ketro_sa_soccer_dataset_advanced]
ORDER BY total_contributions DESC;

