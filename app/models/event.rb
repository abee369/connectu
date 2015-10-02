class Event < ActiveRecord::Base
	has_many :attendances, :foreign_key => "event_id"
	belongs_to :attendance

end
