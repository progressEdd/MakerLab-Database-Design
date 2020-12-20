- [MakerLab Database Design](#makerlab-database-design)
  * [BADM 554 Final Project](#badm-554-final-project)
  * [Mia Berkley, Daisy Li, Alan Xue, Edward Tang, Neel Ganta](#mia-berkley--daisy-li--alan-xue--edward-tang--neel-ganta)
- [Introduction](#introduction)
- [Scope](#scope)
  * [Summary](#summary)
  * [Impact:](#impact-)
  * [Deliverables:](#deliverables-)
  * [Company & Context](#company---context)
- [Goals Of Our Project](#goals-of-our-project)
- [Business Rules](#business-rules)
- [Conceptual design (E-R diagram) and logical design:](#conceptual-design--e-r-diagram--and-logical-design-)
- [Glossary](#glossary)
- [Critique: Problems/weaknesses with our current design or database.](#critique--problems-weaknesses-with-our-current-design-or-database)
- [Contribution of each individual team member](#contribution-of-each-individual-team-member)
- [Database](#database)
  * [**Business Reports**](#--business-reports--)

<small><i><a href='http://ecotrust-canada.github.io/markdown-toc/'>Table of contents generated with markdown-toc</a></i></small>

# MakerLab Database Design
   ## BADM 554 Final Project
   
   ## Mia Berkley, Daisy Li, Alan Xue, Edward Tang, Neel Ganta

# Introduction
Illinois MakerLab is the first business school 3D printing lab in the world managed by Executive Director Dr. Aric Rindfleisch and Director Vishal Sachdev. Its mission is to help University of Illinois students, faculty and staff engage with the 3D modeling and printing technologies. While providing students with hands-on business experience in manufacturing, retailing, supply chain, and pricing as a complete ecosystem, MakerLab accepts customers orders outside the university to assist the daily operation of the laboratory. Current version of the management system of MakerLab involved fewer databases, with garbage data and un-updated entries. To be able to increase work efficiency and real-time data collection, we designate a brand new database system for MakerLab to address these issues.

# Scope
## Summary 
  The scope of the project is to make a better robust database to handle orders and reservations for the clients, the Director and Co-Director of the Illinois Makerlab. The end users of this database include operational staff and volunteers. 

 The current setup is a project management system with light database features. The impetus behind a decision is from garbage data. Garbage data includes customers who paid for orders, but entries were not updated, as well as, services provided, but payment not updated.  
This project aims to make a better robust database to handle orders and reservations. Furthermore, this project aims to keep track of the following:

| Scope of the project                                                                                                                                                                                 | Outside of scope                                                                                                                                 |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------|
| • Employee tracking<br>• Employee time sheets<br>• Donations<br>• Maintenance logs for equipment<br>• Order tracking<br>• Daily visitors<br>• Events<br>• Inventory (materials and premade products) | • Suggesting hardware solutions<br>• Front end-user interface<br>• Integration to project management software<br>• Changing the Makerlab website |

## Impact:
  This project will be able to develop easy access to an organized database system for MakerLab, helping them tracking orders status and inventories on live as well as store employee's information securely and  able to locate maintenance logs more efficiently and reduce concerns of missing data.

The measurable difference of our project is cutting costs on day to day operation and lower budget in the long run. Also, the sign-in system will promote customer experience. Events planning will be more accessible to update and available for recording to every single end-user of the database system. Both online and in-person orders fulfill time will be improving. Keeping track of printer usage and maintenance will allow the MakerLab to monitor all their equipment and know when the printer needs to be replaced.

## Deliverables:
The first deliverable will be a  project scope that also happens to be this very document. It will outline the rest of the project and establish roles within the group and basic summary information regarding the rest of the deliverables.

Throughout the duration of the course we will also be handing in five weekly status reports. These reports will be in the form of a thread in the discussion forum. These threads must include interaction with the client and will be available to the wretched masses.
The first deliverable for the data model is a conceptual design. The deliverable must include the business rules, the conceptual design in MYSQL Workbench, the glossary of terms, and all high-level entities and relationships in a ER diagram. 

The next deliverable must necessarily be the logical design of the data model. Included within this are 5 individual deliverables which are: Final scope of the project, a revised E-R diagram, revised business rules/glossary, a list of reports the describe the queries from each report, and tables in MySQL
A presentation deliverable will then be produced and presented to the class. The presentation will be only 10 minutes long and will consist of such: a summary of the functionality, discuss ERD weakness/differences from other teams and justify major design decisions, describe the queries created, and then explain how they satisfy client needs.

The last major deliverable will be a final report alongside the database. This report will consist of an introduction of the organization and the business problem to be addressed, the scope of the project, goals of the project, listing of business rules, discussion of conceptual and logical design, glossary of terms, critique of the design of database, documentation of contribution of each individual team member, a PDF of E-R diagram, and finally update the database on the allocated team# schema on amazon with dummy data.

## Company & Context
We are working with MakerLab at the University of Illinois to create a better data management system than what they are currently using. Currently MakerLab is using a hybrid-system which consists of project management plus half of a database. We plan on creating a larger database where they can find information in one place easily. 

# Goals Of Our Project
The intended end users will be staff in the MakerLab, since the project aims to improve the database system over operations of MakerLab. With implementing the system we designed, MakerLab will be able to improve cost efficiency on daily operations, helping to store customer and employee information, tracking order status and real-time inventory, digitizing order information will greatly reduce order processing time. Tracking printer usage and maintenance allows MakerLab to monitor all equipment, make repairs or replacements in a timely manner, store and efficiently manage staff information, maintain logs, and reduce data loss concerns. At the same time, a database system helping event planning, makes it easier to access and analyze data.

# Business Rules
1. A person can be an employee, donor, in attendance, or all three. If an individual is an employee, donor, or was in attendance, they must also be a person and given an ID.
2. A donor must have made at least one donation, and each donation must be tied to a specific donor.
3. A donation can be in the form of a material, but a material may be donated multiple times or none at all.
4. An employee must log their hours when they work in the timesheet. Each entry in the timesheet must be specific to an employee.
5. During a day of work, an employee may log entries in the maintenance log. Each entry must be specific to the employee that logged it. 
6. Each entry in the maintenance log is related to only one piece of equipment. Each piece of equipment must have at least one entry in the maintenance log.
7. Each piece of equipment can be placed in surplus multiple times or not at all. If surplus exists, it needs to have at least one piece of equipment. If a piece  of equipment was surplused, the company can bring the equipment back into circulation if need be.
8. A person may attend multiple events and an event may have many people.
9. A specific event can be a birthday party, and each birthday must be logged as one event.
10. A person can make orders from Makerlab, and each order must be associated with only one person.
11. An order may receive many payments, but each payment must be specific to one order.
12. An order must have at least one line, and each line must be specific to one order.
13. Each line must include one and only one product, but each product may be in one or more lines.
14. An individual purchase Makerlab makes can be entered as a product. A product can be purchased none or many times.
15. An individual purchase Makerlab makes can be entered as a material. Materials can be purchased none or many times.
16. An individual purchase Makerlab makes can be entered as equipment. Equipment can be purchased none or many times.
17. Each purchase must come from one and only one vendor. Makerlab can make many purchases from a vendor.

# Conceptual design (E-R diagram) and logical design:
Our E-R diagram begins with a person, including their designations like employees and their types. We then store employee timesheets, and donors and donations. We link donations to materials, and materials are in relation to maintenance and equipment, tracking surpluses as well. The Makerlab has events, and we track attendees and event types. Orders flow to line and product tables, and then invoice and purchase information will span from this as well. 

During the process of modeling, we realized that we had multiple many to many relationships between tables. The donation and line tables were bridge entities created to model the many to many relationships. We decided to design our tables minimally and we may have traded off more detail in extra tables. We condensed our tables and fit as much as we could branching from person to purchase. 

We decided to normalize our tables to organize our data in the database. We did so to minimize redundancies like in the invoice table, and ensured only related data is stored in each table. We ensured that our database met the entity integrities and this is another reason why we normalized our tables. 

# Glossary

| **Term** | **Definition** |
| --- | --- |
| **Person** | Anyone who has a relationship with Makerlab. |
| _person\_id_ | A unique number attributed to each person. |
| _category_ | Designation of the person, it could be either employee or patron. |
| _college_ | The College that the person belongs to, could be null if he/she is not with our university. |
| _UIN_ | User Identification Number: assigned ID for faculty, staff, and students at the University of Illinois. |
| **Employee** | A person that works for the Makerlab. |
| _start\_date_ | First day of a guru being employed. |
| _end\_date_ | Last day of a guru working. |
| _position_ | Role of the employee. |
| **Timesheet** | The log that records both gurus and volunteers&#39; working time window. |
| _Start\_datetime_ | Date and time when the employee or volunteer starts his/her shift. |
| _End\_datetime_ | Date and time when the employee or volunteer ends his/her shift. |
| _project_ | Name of the project the employee is a part of. |
| **Maintenance** | A log to record maintenance for the equipment. |
| _maint\_id_ | An unique number to recognize the maintenance log. |
| _equipment\_p\_code_ | The equipment code of the equipment was maintained. |
| _Employee\_person\_id_ | The id of the employee maintaining the equipment. |
| **Equipment** | The machine that belongs to the university and will be used to make 3D printed products. |
| _equipment\_note_ | Any extra information tied to a specific piece of equipment. |
| _equipment\_desc_ | A description of the specific equipment used. |
| _equipment\_type_ | The specific type of equipment used. |
| **Surplus** | Products in surplus. |
| _date_ | Date in which the surplus was made available. |
| _reason_ | The reason for why the surplus exists. |
| **Attendance** | Track who was at a specific event or at the lab. |
| _role_ | The role of the individual who is in attendance. For employees that are in attendance they are listed as leads or helpers. |
| **Event** | An activity that the Makerlab hosts. |
| _person\_id_ | ID of coordinator person. |
| _event\_type_ | Type of event (workshop, summer event, free prints, and birthdays). |
| _event\_date_ | Date of each event. There exists a daily event that serves to track daily visitors to Makerlab regardless of any orders made. |
| **Birthday** | Birthday event in Makerlab. |
| _number\_attendees_ | Number of attendees to the birthday event. |
| **Purchase** | Transactions of Makerlab&#39;s procurement. |
| _Price\_per\_unit_ | Cost per unit for a purchased good from vendor; specific to item |
| **Material** | Raw materials used for 3D printing, could be either purchased or donated. |
| _material\_desc_ | Brief description of the material. |
| **Donations** | Items that are donated by donors. |
| _donation\_date_ | The unique date in which the donation was made. Used to track specific donations from individuals alongside their _person\_id_ and_material\_id_. |
| _value_ | Amount donated. |
| **Donor** | A person who has donated. |
| _organization_ | Name of organization the donor is a part of. |
| **Vendor** | The supplier that the Makerlab purchases from. |
| _contact_ | The name of the representative from the vendor. |
| **Line** | Line units of Invoice, detailed tracking information of orders. |
| _units_ | Number of units in the line items. |
| **Product** | Products available to create or in stock at the Makerlab. |
| _QOH_ | Product quantity on hand. |
| _minimum_ | Minimum QOH before purchase must be made. |
| _price\_per\_unit\_sale_ | Price per unit Makerlab sells a product; specific to the item. |
| **Order** | Orders Makerlab received, general information about orders. |
| _estimated\_completion_ | The expected order fulfillment date. |
| _delivery\_method_ | The way to send the products to the customer. Can also be an event, which is used to track payments toward an event. |
| **Payment** | Log of a payment made for a given order. |
| _payment\_method_ | Record of payment method (credit, debit, cash, mail order, etc…). |
| _amount\_paid_ | Amount paid for an individual payment made. |
| _down\_payment_ | Any order above $20 requires a 20% down payment |

# Critique: Problems/weaknesses with our current design or database.
* Relationship between purchase, material, and equipment are optional, thus if a 3d printer is donated, the respective entries will need to be manually entered into the equipment and materials table
* A donation must have an item from the materials table. If a donor were to donate something novel to the lab, a material id entry would need to be added before the donation can be logged
* Timesheets do not indicate the position of the employee for that particular day. In other words, we would not know the time period an employee spent as a volunteer and as a guru.

# Contribution of each individual team member
1. Alan Xue
      * Collaborated on constructing and tuning conceptual and logical models.
      * Wrote business rules and parts of the glossary.
      * Assisted in creating queries used during presentation.
      * Created queries and views for database.
      * General editing and updating of written portions and ER model.
2. Daisy Li
      * Submitted weekly Reports
      * Did parts of business rules and glossary
      * Kept track of conceptual design and ER model to assisted with normalization
      * Helped with dummy data and queries for business reports
3. Edward Tang
      * Hosted repository and MySql Workbench work
      * Forward engineered ER model
      * On call for supporting data upload
4. Neel Ganta
      * Assist with Business Rules and Glossary
      * Create Business Reports
      * Assist with Dummy Data
      * Assist with Final Report
5. Mia Berkley
      * Worked on the ER model
      * Revised and created queries
      * Assembled the final paper
      * Active link between SQL changes on business rules and glossary
      * Gathered members for meetings and assigned tasks to members
  
# Database
## **Business Reports**

1. Event Attendee Report
      * We create a list of persons who attended the event, along with the event type, event date, and role of host from the event table, and the first and last name, email, college, and category from the person table.
1. Donations Report
      * From the Donor Table that lists the first and last name pulled from a person\_id (personal details listed from the person table) and organization, we list all donations made by that donor from the donations table. The list includes the date, item name, description, and value from the donations table.
1. Volunteer Hours Report (timesheets table)
      * We will list a total of volunteer hours for each volunteer by name using person\_id from the employee table, limiting the employee\_type to volunteer. Then from the timesheet table, we will list the start and end time, along with any notes or projects they contributed to.
1. Maintenance Report
      * Listing the equipment that was maintained, the description of maintenance and date, along with the employee from the maintenance table, as well as the employee first name, last name, and position from the employee table and the equipment detail from the equipment table.
2. Birthday Attendee Report
      * List the number of attendees, and event host from the birthday table.
1. Top Donor Report
      * Count of donations, total amount donated, and type of donation by donor. Identify who is the top donor and offer incentives from the donor table (donor\_id, organization) and donations table (item\_name, item\_desc, value).
1. Surplus Report
      * By keeping track of which machines are placed in surplus(p\_code, notes), we will be able to salvage some parts for other machines that might need repairs. By looking at the notes from the maintenance(p\_code, maint\_desc), we then can find a machine in surplus that can be taken apart.
1. Track Order Cost Report
      * In order to find the total cost of the order, we will use the order(order\_id), line(order\_id, product\_id, units, weight), and product(product\_id, price\_per\_unit\_sale). Total cost needs to be run as a query for integrity purposes.
1. Staff Conversion Report
      * Create a list of staff who have been promoted from a volunteer to a guru from the employee table (employee\_type, position), along with total work hours and start and end date from the timesheet table. Will help identify potential gurus.
1. Most Visited Day Report
      * It is important to know which days are the busiest throughout the year in order to coordinate material deliveries. By utilizing the event(event\_type, event\_date) as well as attendance(id, event\_id), the Makerlab can have a better understanding as to which events they are getting the most traction.  
