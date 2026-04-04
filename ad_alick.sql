create database ad_click;
use ad_click;

select * from ad_click_project;

#1. Overall click_rate
select 
COUNT(*) AS total_users,
SUM(is_click) AS total_clicks,
ROUND(AVG(is_click)*100,2) AS ctr
from ad_click_project;

#2. Click_Rate by gender

SELECT gender,count(*) as total_users,
sum(is_click) as total_clicks,
ROUND(AVG(is_click)*100,2) AS ctr
FROM ad_click_project
GROUP BY gender;

#3. Click_Rate by age

SELECT age_level,count(*) as total_users,
sum(is_click) as total_clicks,
ROUND(AVG(is_click)*100,2) AS ctr
FROM ad_click_project
GROUP BY age_level
order by ctr desc;

#4. click rate by date

SELECT date,count(*) as total_users,
sum(is_click) as total_clicks,
ROUND(AVG(is_click)*100,2) AS ctr
FROM ad_click_project
GROUP BY date;


#5. peak hours & bottom hours 

(select 'Top hours' as type,hour,count(*) as total_users,
sum(is_click) as total_clicks,
ROUND(AVG(is_click)*100,2) AS ctr
from ad_click_project 
group by hour
order by ctr desc limit 5)

union all

(SELECT 'Low Hours' as type,hour,count(*) as total_users,
sum(is_click) as total_clicks,
ROUND(AVG(is_click)*100,2) AS ctr
FROM ad_click_project
GROUP BY hour
ORDER BY ctr ASC LIMIT 5)

order by ctr desc;

#6. top products with ctr

select product,count(*) as total_users,
sum(is_click) as total_clicks,
ROUND(AVG(is_click)*100,2) AS ctr
from ad_click_project
group by product
order by ctr desc limit 5;

#7. webpage which most ctr

select webpage_id,count(*) as total_users,
sum(is_click) as total_clicks,
ROUND(AVG(is_click)*100,2) AS ctr
from ad_click_project
group by webpage_id
order by ctr desc limit 5;

#8. Analysis by age & which hour

select age_level,hour,
round(avg(is_click)*100,2) as ctr
from ad_click_project
group by age_level,hour
order by ctr desc;

#9. Growth opportunity by product, low users & high ctr

select product,count(*)as total_users,
round(avg(is_click)*100,2) as ctr
from ad_click_project
group by product
order by total_users asc, ctr desc;


