class Task < ActiveRecord::Base
	belongs_to :user
	before_create :jobs

	def jobs
		 if (Task.last.present?)
		 	b=(Task.last.task_number.to_i+1)
		 	self.task_number = b
		else
			self.task_number = 1
		end
		 		
    end
end