class User < ActiveRecord::Base
	has_many :attendances, :foreign_key => "user_id"
	has_many :connections, :through=> :attendances

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, uniqueness: true
	validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/


end
