-- Q1.	
	INSERT INTO rental_records VALUES
   	(NULL,
	'SBA1111A', 
	(SELECT customer_id FROM customers WHERE name='Angel'),
	CURDATE(),
	DATE_ADD(CURDATE(), INTERVAL 10 DAY),
	NULL);

-- Q2.	
	INSERT INTO rental_records 
	VALUES(NULL,'GA5555E',(SELECT customer_id FROM Customers WHERE name = 	'Kumar'),
    DATE_ADD(CURDATE(), INTERVAL 1 DAY),DATE_ADD(DATE_ADD(CURDATE(), INTERVAL 1	DAY),INTERVAL 3 MONTH), NULL);

-- Q3.	
	SELECT
  	 r.start_date  AS `Start Date`,
  	 r.end_date    AS `End Date`,
  	 r.veh_reg_no  AS `Vehicle No`,
   	v.brand       AS `Vehicle Brand`,
  	 c.name        AS `Customer Name`
	FROM rental_records AS r
  	 INNER JOIN vehicles  AS v USING (veh_reg_no)
  	 INNER JOIN customers AS c USING (customer_id)
	ORDER BY v.category, start_date;

-- Q4.	
select * from rental_records where end_date < CURDATE();

-- Q5.	
SELECT 
	rr.veh_reg_no AS 'Vehicle No',
	c.name AS 'Customer Name',
	rr.start_date AS 'Start Date', 
	rr.end_date AS 'End Date' 
	FROM rental_records as rr 
	INNER JOIN Vehicles As v USING(veh_reg_no)
	INNER JOIN Customers As c USING(customer_id)
	WHERE ('2012-01-10' BETWEEN rr.start_date and rr.end_date); 

-- Q6.	
	SELECT 
	rr.veh_reg_no AS 'Registration No',
	c.name AS 'Customer Name',
	rr.start_date AS 'Start Date',
	rr.end_date AS 'End Date'
	FROM rental_records as rr
	INNER JOIN Vehicles as v Using(veh_reg_no)
	INNER JOIN Customers as c Using(customer_id)
	WHERE (CURDATE() BETWEEN rr.start_date AND rr.End_date);

-- Q7.	
	SELECT 
	rr.veh_reg_no AS 'Registration No',
	rr.start_date AS 'Start Date',
	rr.end_date AS 'End Date'
	FROM rental_records as rr
	WHERE (rr.start_date BETWEEN '2012-01-03' AND '2012-01-18') OR
	(rr.end_date BETWEEN '2012-01-03' AND '2012-01-18') OR 
	((rr.start_date < '2012-01-03') AND (rr.end_date > '2012-01-18'));

-- Q8.	
	SELECT 
	rr.veh_reg_no AS 'Registration No',
	v.brand AS 'Vehicle Brand',
	v.`desc` AS 'Vehicle Description'
	FROM rental_records AS rr
	INNER JOIN Vehicles as v Using(veh_reg_no)
	WHERE NOT ('2012-01-10' BETWEEN rr.start_date AND rr.end_date); 

-- Q9.	
	SELECT 
	rr.veh_reg_no AS 'Registration No',
	v.brand AS 'Vehicle Brand',
	v.`desc` AS 'Vehicle Description'
	FROM rental_records as rr
	INNER JOIN Vehicles as v USING(veh_reg_no)
	WHERE NOT ((rr.start_date BETWEEN '2012-01-03' AND '2012-01-18') OR
	(rr.end_date BETWEEN '2012-01-03' AND '2012-01-18') OR 
	((rr.start_date < '2012-01-03') AND (rr.end_date > '2012-01-18')));

-- Q10.	
	SELECT 
	rr.veh_reg_no AS 'Registration No',
	v.brand AS 'Vehicle Brand',
	v.`desc` AS 'Vehicle Description'
	FROM rental_records AS rr
	INNER JOIN Vehicles AS v USING(veh_reg_no)
	WHERE (rr.start_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 10 DAY)) OR 
	(rr.end_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 10 DAY)) OR
	((rr.start_date < CURDATE()) AND (rr.end_date > DATE_ADD(CURDATE(), INTERVAL 10 DAY))); 







		
