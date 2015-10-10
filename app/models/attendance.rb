class Attendance < ActiveRecord::Base
	has_many :connections

	belongs_to :event
	belongs_to :user

end
