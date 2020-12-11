SELECT first_name, last_name, email, college, category, attendance.person_id, attendance.event_id, attendance.role, event.event_type, event.event_date 
FROM person  
JOIN attendance  
ON person.id = attendance.person_id  
JOIN event 
ON attendance.event_id = event.id 
WHERE event.id = 222; 

SELECT donor.person_id, first_name, last_name, donor.organization, donations.date, donations.item_name, donations.item_desc, donations.value  
FROM person  
JOIN donor  
ON person.id = donor.person_id 
JOIN donations 
ON donations.donor_id = donor.id 
WHERE donor.id = 1010; 

SELECT number_attendees, person.first_name, person.last_name 
FROM person
FULL JOIN birthday
ON person.id = birthday.event_person_id
WHERE birthday.id = 1; 

SELECT first_name, last_name, email, college, category, attendance.person_id, attendance.event_id, attendance.role, event.event_type, event.event_date, birthday.number_attendees 
FROM person  
JOIN attendance  
ON person.id = attendance.person_id  
JOIN event 
ON attendance.event_id = event.id 
JOIN birthday
ON event.id = birthday.event_id
WHERE number_attendees  = 5; 