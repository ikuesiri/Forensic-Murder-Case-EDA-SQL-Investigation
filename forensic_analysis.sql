/* 

	EPLORATORY FORENSIC ANALYSIS  FOR A MURDER CASE

*/


/* 

 Project Goal: Find out...

 1. Who killed Roland Greene?
 2. Who are your prime suspects and why?


 Key Information:

 1. He was found dead at 8PM
 2. He was found dead in the Vault Room
 3. He was found dead shortly after receiving a call around 19:55 PM (ie 5mins before he was found dead)

 */

 USE murder_case_DB;

 -- Access log table
 SELECT * FROM access_logs_large;

 -- call recored and to which recipient
 SELECT * FROM call_records_large;

 -- Forensic events desp
 SELECT * FROM forensic_events_large;
 

  -- Suspents  info
 SELECT * FROM suspects_large;

 -- ----------EDA

 -- The Murderer was obviously someone with an accesss to the Vault Room

 -- STEP 1:  Of all the suspects that had access to the vault room 8 Suspects accessed it successfully [access_logs_large table]
 -- STEP 2: Using CTE  and a LEFT JOIN with `suspects_large` table to get access to further details only of the 8 suspects.
 -- STEP 3: I 'LEFT JOIN' to get more information of who the 8 suspects call log.
 -- STEP 4: I added a where clause to filter for those that had access to BEFORE 8PM (when the victim was found died) [Now we have 4 suspects]


WITH vault_room_entry AS (
 
SELECT  
	suspect_id, 
	access_time,
	door_accessed
FROM 
	access_logs_large 
WHERE  
	door_accessed = 'Vault Room' 
	AND  
	success_flag = 1
),

suspects_detail_cte AS
(
SELECT 
	vr.suspect_id, 
	sl.name,
	vr.access_time,
	cr.call_time,
	cr.call_duration,
	cr.recipient_relation AS call_recipient,
	sl.relation_to_victim,
	sl.alibi
FROM vault_room_entry AS vr
LEFT JOIN suspects_large AS sl
	ON vr.suspect_id = sl.suspect_id
LEFT JOIN call_records_large AS cr
	ON vr.suspect_id = cr.suspect_id
WHERE vr.access_time < '2025-06-01 20:00:00.0000000'
)

SELECT *
FROM suspects_detail_cte
ORDER BY
	name,
	call_time DESC

;

SELECT * FROM forensic_events_large;

/*


CONCLUSION:

2.]  Who are your prime suspects and why?

a. Morgan Bennett
b. Samira Shaw
c. Victor Shaw
d. Robin Ahmed

	REASON: 
	My reason for suspecting them, is because the record time log showed that they entered the VAULT ROOM before the gunshot was heard. 
	And the data doesn't indicate if they left or not. So they are the 4 prime suspects.


1.] Who killed Roland Greene?

 -- From My Analysis, I Believe the Killer is SAMIRA SHAW.

 Reasons?
   -- I looked at the correlation between the access time (when they entered the vault), and the call duration they made.. 
   -- I noticed a red fleg in one of his calll recored: 
               'he called A friend at  19:51:36  for 9 minutes and the time he accessed the vault was 19:52:36.
   --This means that he was either in the vault when Mr. Greene was shot, meaning he knows who did it, or he was the killer.

   -- conclusion cannot be 100% drawn from this, but I believer this  can help narrow who down the suspects to be investigated.
*/
