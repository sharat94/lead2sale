class Task < ActiveRecord::Base
	belongs_to :user
	after_create :jobs

	def jobs
		 a = ((Task.last.present?) ? (Task.last.task_number.to_i) : 0)
		 self.task_number = a+1
		 self.save
	end

end
