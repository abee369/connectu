class User < ActiveRecord::Base

  has_many :attendances
  has_many :connections, :through => :attendances
  has_many :events, :through => :attendances
  has_many :connected_users, :through => :connections, source: :user
  has_many :users, :through => :connections, foreign_key: "connected_users"
  # has_many :connections, foreign_key: "connected_user_id"

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
  validates :phone, presence: true,numericality: true, length: { :minimum => 10, :maximum => 15 }
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

	class << self
	  def from_omniauth(auth_hash)
	    user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
	    user.name = auth_hash['info']['name']
	    user.location = get_social_location_for user.provider, auth_hash['info']['location']
	    user.image_url = auth_hash['info']['image']
	    user.url = get_social_url_for user.provider, auth_hash['info']['urls']
	    user.save!
	    user
	  end

	  private

	  def get_social_location_for(provider, location_hash)
	    case provider
	      when 'linkedin'
	        location_hash['name']
	      else
	        location_hash
	    end
	  end

	  def get_social_url_for(provider, urls_hash)
	    case provider
	      when 'linkedin'
	        urls_hash['public_profile']
	      else
	        urls_hash[provider.capitalize]
	    end
	  end
	end
end
