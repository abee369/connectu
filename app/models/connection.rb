class Connection < ActiveRecord::Base
	belongs_to :attendance
	belongs_to :user, foreign_key: :connected_user_id

	validates :connected_user_id, :attendance_id, presence: true
end
