-- 1. What query would you run to get all the sites that client=15 owns?
SELECT domain_name as website, client_id FROM sites WHERE client_id=15;

-- 2. What query would you run to get total count of domain created for June 2011?
SELECT monthname(created_datetime) AS month, count(*) as total_count FROM sites WHERE month(created_datetime)=6 AND year(created_datetime)=2011;

-- 3. What query would you run to get the total revenue for the date November 19th 2012?
SELECT date(charged_datetime) as date, sum(amount) AS revenue FROM billing WHERE date(charged_datetime)='2012-11-19';

-- 4. What query would you run to get total revenue earned monthly each year for the client with an id of 1?
SELECT client_id, sum(amount) AS total_revenue, monthname(charged_datetime) as month, year(charged_datetime) as year FROM billing WHERE client_id=1 GROUP BY month, year ORDER BY year, month;

-- 5. What query would you run to get total revenue of each client every month per year? Order it by client id.
SELECT concat(first_name, ' ', last_name) AS client_name, sum(amount) AS total_revenue, monthname(charged_datetime) as month_charged, year(charged_datetime) as year_charged FROM billing LEFT JOIN clients ON billing.client_id=clients.client_id GROUP BY month_charged, year_charged, billing.client_id ORDER BY clients.client_id, year_charged, month(charged_datetime);

-- 6. What query would you run to get which sites generated leads between March 15, 2011 to April 15, 2011? Show how many leads for each site. 
SELECT domain_name as website, count(*) as number_of_leads FROM leads LEFT JOIN sites ON leads.site_id =sites.site_id WHERE date(registered_datetime) BETWEEN '2011-03-15' AND '2011-04-15' GROUP BY website ORDER BY sites.site_id;

-- 7. What query would you run to show all the site owners, the site name(s), and the total number of leads generated from each site for all time?
SELECT concat(clients.first_name, ' ', clients.last_name) AS client_name, domain_name as website, count(*) as num_leads FROM sites LEFT JOIN clients ON sites.client_id=clients.client_id LEFT JOIN leads ON leads.site_id =sites.site_id GROUP BY client_name, website ORDER BY clients.client_id, website;

-- 8. What query would you run to get a list of site owners who had leads, and the total of each for the whole 2012?
SELECT concat(clients.first_name, ' ', clients.last_name) AS client_name, count(*) as number_of_leads FROM sites LEFT JOIN clients ON sites.client_id=clients.client_id LEFT JOIN leads ON leads.site_id =sites.site_id WHERE year(registered_datetime)=2012 GROUP BY client_name ORDER BY clients.client_id;

-- 9. What query would you run to get a list of site owners and the total # of leads we've generated for each owner per month for the first half of Year 2012?
SELECT concat(clients.first_name, ' ', clients.last_name) AS client_name, count(*) as num_leads, monthname(registered_datetime) as month, year(registered_datetime) FROM clients LEFT JOIN sites ON sites.client_id=clients.client_id LEFT JOIN leads ON leads.site_id =sites.site_id WHERE month(registered_datetime)<'7' AND year(registered_datetime)=2012 GROUP BY client_name, month(registered_datetime) ORDER BY month(registered_datetime), client_name;

-- 10. Write a single query that retrieves all the site names that each client owns and its total count. Group the results so that each row shows a new client. (Tip: use GROUP_CONCAT)
SELECT concat(clients.first_name, ' ', clients.last_name) AS client_name, count(*) AS number_of_sites, GROUP_CONCAT(domain_name) AS sites FROM clients LEFT JOIN sites ON sites.client_id=clients.client_id GROUP BY client_name ORDER BY clients.client_id;