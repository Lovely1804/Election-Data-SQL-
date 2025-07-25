select * from [constituencywise_details (1)]

select * from [constituencywise_results (1)]

select * from [partywise_results (1)]

select * from [states (1)]

select * from [statewise_results (1)]



select Top 0 *
from  [constituencywise_results (1)]




-- 1->wht are the total seats avaiable
SELECT 
COUNT(DISTINCT [Parliament_Constituency]) AS Total_seats
FROM [constituencywise_results (1)]



-- 2->wht are the total number of seats available for elections in each state

select
s.state as state_Name,
count(cr.Parliament_Constituency) as Total_seats-- constituency result table
from
[constituencywise_results (1)] cr
inner join  [statewise_results (1)] sr on cr.Parliament_Constituency = sr.Parliament_Constituency--gives matching records from both the table 
inner join  [states (1)] s on sr.state_id = s.state_id
group by s.state


-- 3->Total seats own by NDA Alliance

SELECT 
    sum(case								--this is a case sensitivity data so wht evry the data is in excel we should give tht only
            when party IN (
                'Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
				'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS', 
                'Janasena Party - JnP', 
				'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM'
            ) then [Won]
            else 0 
        end) as NDA_Total_Seats_Won
from
    [partywise_results (1)]


-- 4-> Seats own by NDA Alliance Parties

SELECT 
    party as Party_Name,
    won as Seats_Won
FROM 
    [partywise_results (1)]
WHERE 
    party IN (
        'Bharatiya Janata Party - BJP', 
        'Telugu Desam - TDP', 
		'Janata Dal  (United) - JD(U)',
        'Shiv Sena - SHS', 
        'AJSU Party - AJSUP', 
        'Apna Dal (Soneylal) - ADAL', 
        'Asom Gana Parishad - AGP',
        'Hindustani Awam Morcha (Secular) - HAMS', 
        'Janasena Party - JnP', 
		'Janata Dal  (Secular) - JD(S)',
        'Lok Janshakti Party(Ram Vilas) - LJPRV', 
        'Nationalist Congress Party - NCP',
        'Rashtriya Lok Dal - RLD', 
        'Sikkim Krantikari Morcha - SKM'
    )
ORDER BY Seats_Won DESC

-- 5->Total seats won by I.N.D.I.A Allianz

SELECT 
    SUM(CASE 
            WHEN party IN (
                'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
            ) THEN [Won]
            ELSE 0 
        END) AS INDIA_Total_Seats_Won
FROM 
    [partywise_results (1)]


--6-> Seats Won by I.N.D.I.A. Allianz Parties

SELECT 
    party as Party_Name,
    won as Seats_Won
FROM 
    [partywise_results (1)]
WHERE 
    party IN (
        'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
    )
ORDER BY Seats_Won DESC

--7->Total Seats Won by I.N.D.I.A. Allianz
SELECT 
    SUM(CASE 
            WHEN party IN (
                'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
            ) THEN [Won]
            ELSE 0 
        END) AS INDIA_Total_Seats_Won
FROM 
    [partywise_results (1)]

--8-> Seats Won by I.N.D.I.A. Allianz Parties

SELECT 
    party as Party_Name,
    won as Seats_Won
FROM 
    [partywise_results (1)]
WHERE 
    party IN (
        'Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
				'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
    )

--9->Add new column field in table partywise_results to get the Party Allianz as NDA, I.N.D.I.A and OTHER

ALTER TABLE [partywise_results (1)]
ADD party_alliance VARCHAR(50);

-- I.N.D.I.A Allianz

UPDATE [partywise_results (1)]
SET party_alliance = 'I.N.D.I.A'
WHERE party IN (
    'Indian National Congress - INC',
    'Aam Aadmi Party - AAAP',
    'All India Trinamool Congress - AITC',
    'Bharat Adivasi Party - BHRTADVSIP',
    'Communist Party of India  (Marxist) - CPI(M)',
	'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
    'Communist Party of India - CPI',
    'Dravida Munnetra Kazhagam - DMK',	
    'Indian Union Muslim League - IUML',
    'Jammu & Kashmir National Conference - JKN',
    'Jharkhand Mukti Morcha - JMM',
    'Kerala Congress - KEC',
    'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
    'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
    'Rashtriya Janata Dal - RJD',
    'Rashtriya Loktantrik Party - RLTP',
    'Revolutionary Socialist Party - RSP',
    'Samajwadi Party - SP',
    'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
    'Viduthalai Chiruthaigal Katchi - VCK'
);


select * from [partywise_results (1)]

-- NDA Allianz

UPDATE [partywise_results (1)]
SET party_alliance = 'NDA'
WHERE party IN (
    'Bharatiya Janata Party - BJP',
    'Telugu Desam - TDP',
    'Janata Dal  (United) - JD(U)',
    'Shiv Sena - SHS',
    'AJSU Party - AJSUP',
    'Apna Dal (Soneylal) - ADAL',
    'Asom Gana Parishad - AGP',
    'Hindustani Awam Morcha (Secular) - HAMS',
    'Janasena Party - JnP',
    'Janata Dal  (Secular) - JD(S)',
    'Lok Janshakti Party(Ram Vilas) - LJPRV',
    'Nationalist Congress Party - NCP',
    'Rashtriya Lok Dal - RLD',
    'Sikkim Krantikari Morcha - SKM'
);


select * from [partywise_results (1)]

--OTHER

UPDATE [partywise_results (1)]
SET party_alliance = 'OTHER'
WHERE party_alliance IS NULL;



-- Total number of seatd won by NDA, I.N.D.I.A

-- Total seats won by party alliance
select 
party_alliance,
sum(won) as Total_seat_won
from [partywise_results (1)]
Group by party_alliance 


--Total seaats won by India 
select 
party,
won
from [partywise_results (1)]
where party_alliance = 'I.N.D.I.A'
Order by won Desc


----Total seaats won by NDA
select 
party,
won
from [partywise_results (1)]
where party_alliance = 'NDA'
Order by won Desc


--10-> Winning candidate's name, their party name, total votes, and the margin of victory for a specific state and constituency?

select 
cr.Winning_Candidate,
pr.party,
pr.party_alliance,
cr.total_votes,
cr.margin,
s.state,
cr.Constituency_Name
from 
[constituencywise_results (1)]cr Inner Join [partywise_results (1)]pr On cr.Party_ID = pr.Party_ID
inner join [statewise_results (1)]sr on cr.Parliament_Constituency =sr.Parliament_Constituency
inner join [states (1)]s on sr.State_ID=s.State_ID
where 
cr.Constituency_Name ='AKOLA'

--11 -> What is the distribution of EVM votes versus postal votes for candidates in a specific constituency?

select
cd.EVM_Votes,
cd.Postal_Votes,
cd.Total_Votes,
cd.Candidate,
cr.Constituency_Name
From [constituencywise_results (1)]cr Join [constituencywise_details (1)]cd
on cr.Constituency_ID = cd.Constituency_ID
where cr.constituency_name ='BANDA'

--12->  Which parties won the most seats in s State, and how many seats did each party win?

SELECT p.Party,
COUNT(cr.Constituency_ID) AS Seats_Won
FROM [constituencywise_results (1)]cr
JOIN[partywise_results (1)]p ON cr.Party_ID = p.Party_ID
JOIN[statewise_results (1)]sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN[states (1)] s ON sr.State_ID = s.State_ID
WHERE s.state = 'Andhra Pradesh'
GROUP BY p.Party
ORDER BY Seats_Won DESC;

--13-> What is the total number of seats won by each party alliance (NDA, I.N.D.I.A, and OTHER) in each state for the India Elections 2024?

SELECT 
s.state,
    SUM(CASE WHEN pr.party_alliance = 'NDA' THEN 1 ELSE 0 END) AS NDA_Seats_Won,
    SUM(CASE WHEN pr.party_alliance = 'I.N.D.I.A' THEN 1 ELSE 0 END) AS INDIA_Seats_Won,
	SUM(CASE WHEN pr.party_alliance = 'OTHER' THEN 1 ELSE 0 END) AS OTHER_Seats_Won
FROM [constituencywise_results (1)]cr
JOIN [partywise_results (1)]pr ON cr.Party_ID = pr.Party_ID
JOIN [statewise_results (1)]sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN [states (1)]s ON sr.State_ID = s.State_ID
WHERE s.state = 'Andhra Pradesh'
group by s.state

--14 ->If i wantt o check all  the state at a time then

SELECT 
s.state,
    SUM(CASE WHEN pr.party_alliance = 'NDA' THEN 1 ELSE 0 END) AS NDA_Seats_Won,
    SUM(CASE WHEN pr.party_alliance = 'I.N.D.I.A' THEN 1 ELSE 0 END) AS INDIA_Seats_Won,
	SUM(CASE WHEN pr.party_alliance = 'OTHER' THEN 1 ELSE 0 END) AS OTHER_Seats_Won
FROM [constituencywise_results (1)] cr
JOIN [partywise_results (1)]pr ON cr.Party_ID = pr.Party_ID
JOIN [statewise_results (1)]sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN [states (1)]s ON sr.State_ID = s.State_ID
group by s.state

--15-> Which candidate received the highest number of EVM votes in each constituency (Top 10)?


SELECT TOP 10
    cr.Constituency_Name,
    cd.Constituency_ID,
    cd.Candidate,
    cd.EVM_Votes
FROM 
    [constituencywise_details (1)]cd
JOIN 
    [constituencywise_results (1)]cr ON cd.Constituency_ID = cr.Constituency_ID
WHERE 
    cd.EVM_Votes = (
        SELECT MAX(cd1.EVM_Votes)
        FROM [constituencywise_details (1)]cd1
        WHERE cd1.Constituency_ID = cd.Constituency_ID
    )
ORDER BY 
    cd.EVM_Votes DESC;