class Customer < ActiveRecord::Base
	belongs_to :user, :class_name => "User", foreign_key: :managed_by
end
