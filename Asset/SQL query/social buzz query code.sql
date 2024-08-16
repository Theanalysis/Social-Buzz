--creating a database [social_buzz]
create database social_buzz
use social_buzz

--joining all the three tables toghether
 select *
 from content c
 join reactions r
 on c.content_id = r.content_id 
 join  reactiontypes rt
 on r.types = rt.types

 --DATA CLEANING PROCESS
 --1.Remove irrelevant data
 --2.Remove duplicate
 --3.fix structural error
 --4. check data type
 --5.standardize/normalize data
 
--1. Remove irrelevant data
 create view buz
 as 
 select Content_ID,Category,Type,datetime,Sentiment,Score
 from content c
 join reactions r
 on c.content_id = r.content_id 
 join  reactiontypes rt
 on r.Type = rt.Type;

--2. fixing structural error

select distinct category,substring(
				category,
				charindex('"',category) +1,
				charindex('"',category,charindex('"',category)+ 1) - charindex('"',category) -1) as texted
from content c
 join reactions r
 on c.content_id = r.content_id 
 join  reactiontypes rt
 on r.Type = rt.Type

 --updating
 update buzz
 set CATEGORY = substring(
				category,
				charindex('"',category) +1,
				charindex('"',category,charindex('"',category)+ 1) - charindex('"',category) -1)

--3. Standardizing the data set
select * from buzz

select concat(
	upper(substring(type,1,1)),
	lower(substring(type,2,len(type))))
from 
	BUZZ;

update buzz
set type = concat(
	upper(substring(type,1,1)),
	lower(substring(type,2,len(type))));

select concat(
	upper(substring(sentiment,1,1)),
	lower(substring(sentiment,2,len(sentiment))))
from BUZZ;

update BUZZ
set Sentiment = concat(
	upper(substring(sentiment,1,1)),
	lower(substring(sentiment,2,len(sentiment))));

select CONCAT(
	upper(substring(category,1,1)),
	lower(substring(category,2,len(category))))
from BUZZ;

update buzz
set category = CONCAT(
	upper(substring(category,1,1)),
	lower(substring(category,2,len(category))))

select distinct CATEGORY
from BUZZ

--4. CHECK DATA TYPE
select table_name,DATA_TYPE
from INFORMATION_SCHEMA.COLUMNS

--5. Rename column

SP_RENAME 'BUZZ.TYPE','Type','column'
sp_rename 'buzz.CATEGORY','Category','column'

