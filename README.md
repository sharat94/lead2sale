# Lead2Sale

Lead2Sale is a Lead Management System which helps automate customer acquisition process.Customer Acquisition follows a sales pipeline which defines a typical step by step process that sales reps go through to convert a prospect into a paying customer.A sales stage is created for each step in the sales process.The sales rep is responsible for moving the stages as the prospect's interest level changes.The number of sales stages will vary based on the length of your sales cycle and the number of interactions needed to close a deal.

#Users & Roles

Users should be able to operate this system only via a email/password authentication system.
Users can only be invited into the application. Registrations should not be allowed.
A User has a Full Name, Email, Password, Phone(10 digit) and role_id.
User belongs_to Roles. Role has_many Users
Users can have one of 2 roles. 1. Sales Manager 2. Sales Associate
Sales Manager has full authority over the software usage while Sales Associate has limited
authority over software usage.
Prospects & Customers
Prospects enter the sales pipeline when a prospect record is created in Lead2Sale. From that
point on, the sales rep guides the prospect through the sales stages. This is not necessarily a
linear process where every prospect goes through every stage. Instead, it is a framework for
making the sales process more systematic and standardized.
The only way a Customer can be created is by automation i.e. when a Prospect purchases
something, then and only then the Prospect qualifies to become a Customer.
A Prospect has a Full Name, Email, Phone(10 digit), Location, stage_id & managed_by.
Prospect belongs_to Stage. Stages has_many Prospects. Prospect also belongs to User with
foreign key of managed_by.
Customer has all attributes of a Prospect except stage_id.

#Stages

There are 9 stages to a sales cycle. The 9 stages are as below:
1. New Opportunity - This stage is assigned as default when a prospect is created.
2. Qualifying - This stage is assigned when the sales rep begins contacting the prospect to
gather details about the prospect and their level of interest on a scale of 1 - 10.
3. Demo - This stage is assigned the prospect agrees to a demo, a free trial, an in person
meeting, etc.
4. Proposal Pending - This stage is assigned after the sales rep issues a quote, proposal or
estimate.
5. Negotiating - This stage is assigned after the prospect responds to a proposal, but
requests some changes before committing to a purchase.
6. Won - This stage is assigned after the prospect makes a purchase. This is when a
customer record is created and a prospect record is archived.
7. Delayed - This stage is assigned if a Prospect is qualified and truly interested in your
product with a interest level of +8, but their decision-making timeline has been delayed.
8. Lost - This stage is assigned if a Prospect purchases from a competitor or decides they
are no longer interested in your product.
9. Non-Responsive - This stage is assigned when the sales rep is not able to connect with a
Prospect.
A Stage has a name, description, color_code, interest_level and actions. Every stage has its
unique set of predefined actions. So actions as an attribute of the Stage can be a hash.
E.g. Consider a stage object as below
{ name: ‘New Opportunity’, description: ‘This stage is assigned as default when a prospect is
created.’, color_code: ‘#FF5733’, interest_level: 8, actions: { email: { send: true, datetime:
2017-06-15 00:30:00 +0530, template: ‘Product Intro’}, task: {mandatory: true, name: ‘Call
Customer’} }}


#Tasks

Tasks are jobs that are to be assigned to and be completed by a user.
User has_many Tasks & A Task belong_to a User.
Task has title, content, task_number, event_datetime & completed_at.
Task Number is auto generated and incremented based on the previous record.

# Business Logic

Users & Roles
User should be created with valid email, phone and all fields must be mandatory. Validations
should be present on both server-side as well as client-side.
Sales Manager can manage i.e. CRUD, Prospects, Customers, Users, Stages & Email Templates.
Exception being the create of customer as that is an automated process.
Sales Associate can CRU Prospects. Each Sales Associate can only manage their own Prospects.

Prospects & Customers
Only when a Prospect has attained the stage of ‘Won’, can it be moved as a Customer. All
Prospects initialize with the ‘New Opportunity’ Stage and is guided down the sales process by
the sales rep.

STAGE ACTIONS

NEW OPPORTUNITY: Should send email to Prospect with template
of “Product Intro” and create a task to the
current user with Title: Call {Prospect_Name}
Tomorrow at {Event_Time}, Content: Please
call {Prospect_Name} tomorrow at
{Event_Time} on {Prospect_Phone}

QUALIFYING: Should set interest level after engaging with
Prospect and either schedule a demo or any
other status.

DEMO: Should send email to Prospect with template
of “Product Demo” and create a task to the
current user with Title: Meeting with
{Prospect_Name} on {Event_Date} at
{Event_Time}, Content: Please engage with
{Prospect_Name} on {Event_Date} at
{Event_Time} for Product Demo.

PROPOSAL PENDING: Should send email with template of “Product
Proposal & Quotation”. Email should contain
three options, Accept, Decline, Negotiate.
On click of Accept, the Prospect should be
moved to the “Won” Stage.
On click of Decline, the Prospect should be
moved to the “Lost” Stage.
On click of Negotiate, the Prospect should be
moved to the “Negotiating” Stage.

WON: Should move Prospect to Customer Model
and send email to Customer with template
“Welcome onboard” and create a task to the
current_user with Title: Check up with
{Prospect_Name} on {Event_Date} at
{Event_Time}, Content: Please engage with
{Prospect_Name} on {Event_Date} at
{Event_Time} to get feedback.

DELAYED: Should create a task to the current_user with
Title: Follow up with {Prospect_Name} on
{Event_Date} at {Event_Time}, Content: Please
engage with {Prospect_Name} on
{Event_Date} at {Event_Time} to finalize
purchase.

LOST: Should send email to Prospect with template
of “Thank you”.

NEGOTIATING: Should create a task to the current_user with
Title: Follow up with {Prospect_Name} on
{Event_Date} at {Event_Time}, Content: Please
engage with {Prospect_Name} on
{Event_Date} at {Event_Time} to negotiate
price and persuade to purchase.

NON-RESPONSIVE: Should create a task to the current_user with
Title: Follow up with {Prospect_Name} on
{Event_Date} at {Event_Time}, Content: Please
engage with {Prospect_Name} on {Event_Date
+ 30 DAYS} at {Event_Time + 30 DAYS}.