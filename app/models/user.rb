class User < ActiveRecord::Base

  has_many :attendances
  has_many :connections, :through => :attendances
  has_many :events, :through => :attendances
  has_many :users, :through => :connections, :as => :connected_user_id
  has_secure_password

  def password
    @password ||= BCrypt::Password.new(password_digest)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_digest = @password
  end


  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/


end
