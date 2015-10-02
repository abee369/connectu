class Attendance < ActiveRecord::Base
	has_many :connections, :foreign_key => "attendance_id"
	belongs_to :event

end
