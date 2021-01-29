/*Importing json file 
As we were presented with a sample JSON file containing all the statistics of the English Premier League matchdays.
The file contained all the detailed statistics of the matchdays and using those properties we were instructed to solve the queries presented to us in the brief.
Here the syntax below imports the JSON file into the Mongodb system. All the contents were imported into ‘epltable’ collection inside premier database.
*/

mongoimport --jsonArray --db premier --collection league --file F:\mongoassignment\epl.json

/* 
--Query 1
 Show all the EPL teams involved in the season.
This syntax lists all the teams involved in the premiership. The syntax uses the collection ‘league and using ‘distinct’ method.
It lists all the distinct ‘AwayTeam’ in the database which results in all the away teams with no repetitions. 
There are 20 teams playing against eachother home and away so a team has to feature in a home game with every opponent, using this logic the distinct was used to all the distinct away teams in the league.
*/

db.league.distinct(‘AwayTeam’)
 


/*--Query 2
How many matches were played on Mondays?
For the completion of this query, the given string format date structure was converted in ISO format using a function. Then $dayOfWeek was used to break down the ISO date format which converts it into days of the week. At the end through aggregation the extracted days of the week is used to result the final output where ‘Count’ is used to view the total number of Mondays (2).
After executing the query, it was checked if the conversion was successful. By using find method and listing all the ‘date’ in the data, we find
Now we break down our ISO date format using $dayOfWeek, this will give us result on all the days of the week the matches were played. Here (2) means second day of week i.e. Monday. 
Using aggregate function now we count the number of Mondays from the extracted day, in this case Monday means 2. So we count all the 2’s using aggregation we get
 */

Using $dayOfWeek to breakdown the date field
db.epltable.aggregate( [
{
$project:{
_id:0,
dayOfWeek: { $isoDayOfWeek: "$Date"},
}
}
])
