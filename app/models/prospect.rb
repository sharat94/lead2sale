class Prospect < ActiveRecord::Base
	belongs_to :stage
	belongs_to :user
	after_commit :background_jobs

	def background_jobs
		StagesWorker.perform_async(self.id)
	end
end
