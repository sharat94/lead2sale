class Task < ActiveRecord::Base
	belongs_to :user
	after_commit :jobs

	def jobs
		a = self
		 if (Task.last.present?)
		 	a=(Task.last.task_number.to_i) + 1
		 a.task_number = a
		else
			a.task_number = 1
		end
		 a.save	
		end

end
