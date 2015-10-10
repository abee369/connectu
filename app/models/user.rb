class User < ActiveRecord::Base
	has_many :attendances
	has_many :connections, :through => :attendances
	has_many :events, :through => :attendances
	has_many :users, :through => :connections, :as => :connected_user_id

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, uniqueness: true
	validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/


end
