class Attendance < ActiveRecord::Base
	has_many :connections
	has_many :users, :through => :connections, :as => :connected_user_id

	belongs_to :event
	belongs_to :user

end
