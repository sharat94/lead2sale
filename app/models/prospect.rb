class Prospect < ActiveRecord::Base
	belongs_to :stage
	belongs_to :user, :class_name => "User", foreign_key: :managed_by
	after_commit :background_jobs
	validates_presence_of :full_name, :location, :phone, :email, :stage_id, :managed_by
	validates_length_of :phone, is: 10
	validates_numericality_of :phone
	validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
	validates_uniqueness_of :phone, :email , scope: :managed_by

	def background_jobs
		
		StagesWorker.perform_async(self.id)
		mail = Notification.send_email(self.id)
		mail.deliver_later!
	end
end
