class Event < ActiveRecord::Base
	has_many :attendances
	has_many :users, :through => :attendances

  validates :event_title, presence: true 

end
