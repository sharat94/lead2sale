class Prospect < ActiveRecord::Base
	belongs_to :stage
	belongs_to :user, :class_name => "User", foreign_key: :managed_by
	after_commit :background_jobs

	def background_jobs
		
		StagesWorker.perform_async(self.id)
		mail = Notification.send_email(self.id)
		mail.deliver_later!
	end
end
