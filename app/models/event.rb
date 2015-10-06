class Event < ActiveRecord::Base
	has_many :attendances, :foreign_key => "event_id"
	belongs_to :attendance
  validates :event_title, presence: true 

end
