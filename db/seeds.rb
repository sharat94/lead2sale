# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Stage.create("name"=>"New Opportunity", "description"=>"This stage is assigned as default when a prospect is 
created.","color_code"=>"#FF5733","interest_level"=>5, "actions"=> { "email"=> { "send"=> "true", "datetime"=>"#{DateTime.now}","template"=>"Product Intro"}, "task"=> {"mandatory"=>"true", "name"=>"Call Customer"}})

Stage.create("name"=>"Qualifying", "description"=>"Should set interest level after engaging with Prospect and either schedule a demo or anyother status.","color_code"=>"#FF5733","interest_level"=>6, "actions"=> { "email"=> { "send"=> "false", "datetime"=>"#{DateTime.now}","template"=>"none"}, "task"=> {"mandatory"=>"true", "name"=>"Schedule Demo"}})

Stage.create("name"=>"Demo", "description"=>"This stage is assigned the prospect agrees to a demo, a free trial, an in personmeeting, etc.","color_code"=>"#FF5732", "interest_level"=>7 ,"actions"=> { "email"=> { "send"=> "true", "datetime"=>"#{DateTime.now}","template"=>"Product Demo"}, "task"=> {"mandatory"=>"true", "name"=>"Customer Demo"}})

Stage.create("name"=>"Proposal Pending", "description"=>"This stage is assigned after the sales rep issues a quote, proposal or estimate.","color_code"=>"#FF5731","interest_level"=>7, "actions"=> { "email"=> { "send"=> "true", "datetime"=>"#{DateTime.now}","template"=>"ProductProposal & Quotation"}, "task"=> {"mandatory"=>"false", "name"=>"none"}})

Stage.create("name"=>"Negotiating", "description"=>"This stage is assigned after the prospect responds to a proposal, but requests some changes before committing to a purchase.","color_code"=>"#FF5733","interest_level"=>8, "actions"=> { "email"=> { "send"=> "false", "datetime"=>"#{DateTime.now}","template"=>"none"}, "task"=> {"mandatory"=>"true", "name"=>"Customer Negotiation"}})

Stage.create("name"=>"Won", "description"=>"This stage is assigned after the prospect makes a purchase. This is when a customer record is created and a prospect record is archived.","color_code"=>"#FF5733","interest_level"=>10, "actions"=> { "email"=> { "send"=> "true", "datetime"=>"#{DateTime.now}","template"=>"Welcome onboard"}, "task"=> {"mandatory"=>"true", "name"=>"Customer Engagement"}})

Stage.create("name"=>"Delayed", "description"=>"This stage is assigned if a Prospect is qualified and truly interested in yourproduct with a interest level of +8, but their decision-making timeline has been delayed.","color_code"=>"#FF5733","interest_level"=>8, "actions"=> { "email"=> { "send"=> "false", "datetime"=>"#{DateTime.now}","template"=>"none"}, "task"=> {"mandatory"=>"true", "name"=>"Customer finalisation"}})

Stage.create("name"=>"Lost", "description"=>"This stage is assigned if a Prospect purchases from a competitor or decides theyare no longer interested in your product.","color_code"=>"#FF5733","interest_level"=>0, "actions"=> { "email"=> { "send"=> "true", "datetime"=>"#{DateTime.now}","template"=>"Thank You"}, "task"=> {"mandatory"=>"false", "name"=>"none"}})

Stage.create("name"=>"Non-Responsive", "description"=>"This stage is assigned when the sales rep is not able to connect with a Prospect","color_code"=>"#FF5733","interest_level"=>3, "actions"=> { "email"=> { "send"=> "false", "datetime"=>"#{DateTime.now}","template"=>"none"}, "task"=> {"mandatory"=>"true", "name"=>"Follow Up"}})


Role.create("name"=>"Sales Manager")
Role.create("name"=>"Sales Associate")

u1=User.new("email"=>"salesmanager@gmail.com", "full_name"=>"Aniket", "phone"=>"9037534733", "role_id"=>"#{Role.where("name=?","Sales Manager").last.id}", "password"=>"ani123")
u1.confirm
u1.save
u2=User.new("email"=>"salesassociate@gmail.com", "full_name"=>"Aniket", "phone"=>"9037534733", "role_id"=>"#{Role.where("name=?","Sales Associate").last.id}", "password"=>"ani123")
u2.confirm
u2.save