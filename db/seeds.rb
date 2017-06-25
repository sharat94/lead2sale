# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Stage.create("name"=>"New Opportunity", "description"=>"This stage is assigned as default when a prospect is 
created.","color_code"=>"#FF5733","interest_level"=>8, "actions"=> { "email"=> { "send"=> "true", "datetime"=>"2017-06-15 00:30:00 +0530","template"=>"Product Intro"}, "task"=> {"mandatory"=>"true", "name"=>"Call 
Customer"}})