
i should check these work with 2015 too, and cross reference the answers with otto. either by writing them down or doing it in person.

candidate = id, name, party, ward, votes

Party = id, name

ward = id, name, electorate


Problem 1

SELECT Party.name FROM Party;

Problem 2
select sum(Candidate.votes) from Candidate;
or
select sum(Candidate.votes) as SumOfVotes from Candidate;

Problem 3
//improvised this myself
select name,votes from Candidate where Candidate.ward = (select id from Ward where name = 'Bedminster');


Problem 4

how many votes, lib dems (party number) in filwood (ward number)

select sum(Candidate.votes) from Candidate where Candidate.ward = (select id from Ward where name = 'Filwood') and Candidate.party = (select id from Party where name = 'Liberal Democrat');

Problem 5
Produce a table with three columns called name, party, votes showing the
results for the Hengrove ward, ordered by number of votes (highest first).
The 2014 solution is:

select Candidate.name, Party.name, Candidate.votes from Candidate, Party where Candidate.party = Party.id and Candidate.ward = (select id from Ward where name = 'Hengrove') order by votes desc;

Problem 6
Which rank (1 st , 2 nd , 3 rd ...) did Labour end up in Bishopsworth?
Your solution should be a table with one row and one column containing the answer
as a number. Hint: count the number of parties that got the same number or more
votes than Labour. You may assume no ties.
The 2014 solution is 2 (Labour came second).

select count(votes) from Candidate where votes >= (select votes from Candidate where Candidate.party = (select id from Party where name = 'Labour') and Candidate.ward = (select id from Ward where name = 'Bishopsworth')) and Candidate.ward = (select id from Ward where name = 'Bishopsworth');


7. How successful (in % of votes cast) was the Green party in each ward?
You do not need to sort the results. The 2014 solution is (one row per ward):

Avonmouth 4.3772
Bedminster 22.4605
...         ...
Windmill Hill 24.0964


select (select name from Ward where id=A.ward), (A.votes/B.sum*100) as percent

FROM

(select ward, sum(votes) as votes

from Candidate

where party in (select id from Party where Party.name = 'Green')

group by ward)

as A



inner join

(select ward, sum(votes) as sum

from Candidate group by ward)

as B

on A.ward = B.ward;



inner join

select name, id

from Ward

as C;



/* 8.
Find all the wards where the Greens beat Labour and create a table with
columns ward,rel,abs where name is the ward name, rel is the relative
difference as a percentage of the electorate in the relevant ward and abs is the
absolute difference in votes between the Greens and Labour in this ward.

The 2014 solution is:

ward        rel     abs
Bishopston    10.4630 1078
Redland        8.9236 776
Southville    3.8949 378
Stoke Bishop   0.5564 45
*/


select (select name from Ward where id = A.ward) as ward,
  (A.total-B.total) * 100 / (select electorate from Ward where id = A.ward) as rel,
   A.total-B.total as abs

From

(select ward, sum(votes) as total

from Candidate

where party in (select id from Party where Party.name = 'Green')

group by ward)

as A

inner join

(select ward, sum(votes) as total

from Candidate

where party in (select id from Party where Party.name = 'Labour')

group by ward)

as B

on A.ward = B.ward

where A.total > B.total;
