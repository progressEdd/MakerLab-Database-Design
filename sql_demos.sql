-- event attendance
SELECT first_name, last_name, email, college, category, attendance.person_id, attendance.event_id, attendance.role, event.event_type, event.event_date 
FROM person  
JOIN attendance  
ON person.id = attendance.person_id  
JOIN event 
ON attendance.event_id = event.id 
WHERE event.id = 222; 

-- donor
SELECT donor.person_id, first_name, last_name, donor.organization, donation.date, donation.item_name, donation.item_desc, donation.value  
FROM person  
JOIN donor  
ON person.id = donor.person_id 
JOIN donation 
ON donation.donor_id = donor.id 
WHERE donor.id = 1010; 

-- birthday
SELECT first_name, last_name, email, college, category, attendance.person_id, attendance.event_id, attendance.role, event.event_type, event.event_date
FROM person  
JOIN attendance  
ON person.id = attendance.person_id  
JOIN event 
ON attendance.event_id = event.id 
JOIN birthday
ON event.id = birthday.event_id
WHERE number_attendees  = 5; 

-- volunteer
SELECT person_id, first_name, last_name, email, college, category, employee_type, employee.postion 
FROM person
JOIN employee 
ON person.id = employee.person_id
JOIN timesheet
ON employee_person_id = timesheet.employee_person_id
GROUP BY person_id
HAVING employee.postion = "volunteer";
