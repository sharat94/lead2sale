class StagesWorker

include Sidekiq::Worker
  sidekiq_options queue: "high"
  # sidekiq_options retry: false

  def perform(work_id)
  	a=Prospect.find(work_id)
  	b=eval(a.stage.actions["task"])
    puts a.full_name
    puts b
  	if b["mandatory"] == "true"
  		if b["name"] == "Call Customer"
  			a.user.tasks.create(title: "Call #{a.full_name} Tomorrow at #{Time.now.hour}:#{Time.now.min}", content: "Please call #{a.full_name} tomorrow at #{Time.now.hour}:#{Time.now.min} on #{a.phone.to_i}")
  		elsif b["name"] == "Schedule Demo"
  			a.user.tasks.create(title: "Schedule demo or other stages for #{a.full_name} ", content: "Please call #{a.full_name} to schedule demo on #{a.phone.to_i}")
  		elsif b["name"] == "Customer Demo"
  			a.user.tasks.create(title: "Meeting with #{a.full_name} on #{Date.tomorrow} at #{Time.now.hour}:#{Time.now.min}" , content: "Please engage with #{a.full_name} on #{Date.tomorrow} at #{Time.now.hour}:#{Time.now.min} for Product Demo.")
  		elsif b["name"] == "Customer Negotiation"
  			 a.user.tasks.create(title: "Follow up with #{a.full_name} on #{Date.tomorrow} at #{Time.now.hour}:#{Time.now.min}" , content: "Please engage with #{a.full_name} on #{Date.tomorrow} at #{Time.now.hour}:#{Time.now.min} to negotiate price and persuade to purchase.")
  	    elsif b["name"] == "Customer Engagement"
 			Customer.create(full_name: "#{a.full_name}", email: "#{a.email}", phone: "#{a.phone.to_i}", location: "#{a.location}", managed_by: "#{a.managed_by}")
 		   a.user.tasks.create(title: "Check up with #{a.full_name} on #{Date.tomorrow} at #{Time.now.hour}:#{Time.now.min}", content: "Please engage with #{a.full_name} on #{Date.today} at #{Time.now.hour}:#{Time.now.min} to get feedback.")
 		elsif b["name"] == "Customer finalisation"
 			a.user.tasks.create(title: "Follow up with #{a.full_name} on  #{Date.tomorrow} at #{Time.now.hour}:#{Time.now.min}", content: "Please engage with #{a.full_name} on #{Date.today} at #{Time.now.hour}:#{Time.now.min} to finalize purchase.")
 		elsif b["name"] == "Follow Up"
 			a.user.tasks.create(title: "Follow up with #{a.full_name} on #{Date.today + 30.days} at #{Time.now.hour}:#{Time.now.min}", content: "Please engage with #{a.full_name} on #{Date.today + 30.days} at #{Time.now.hour}:#{Time.now.min}")
 		end
 	end
  end
end
