class LinkedinController < ApplicationController
	before_filter :authenticate_user!

	@@config = { 
    :site => 'https://api.linkedin.com',
    :authorize_path => '/uas/oauth/authenticate',
    :request_token_path => '/uas/oauth/requestToken?scope=r_basicprofile+r_fullprofile+r_emailaddress',   
    :access_token_path => '/uas/oauth/accessToken' 
  	}

	def generate_linkedin_oauth_url
    	if LinkedinOauthSetting.find_by_user_id(current_user.id).nil?
     	 	client = LinkedIn::Client.new('your-api-key', 'your-secret-key', @@config)
      	 	request_token = client.request_token(:oauth_callback => "http://#{request.host}:#{request.port}/oauth_account")
      	 	session[:rtoken] = request_token.token
      	 	session[:rsecret] = request_token.secret
      	 	redirect_to request_token.authorize_url
    	else
      		redirect_to "/oauth_account"
    	end
  	end

  	def oauth_account
  	 	client = LinkedIn::Client.new('your-api-key', 'your-secret-key', @@config)
 		pin = params[:oauth_verifier]
  			if pin
    			atoken, asecret = client.authorize_from_request(session[:rtoken], session[:rsecret], pin)
    			LinkedinOauthSetting.create!(:asecret => asecret, :atoken => atoken, :user_id => current_user.id)
			 end
 			redirect_to "/"
	end

	def get_client
  		linkedin_oauth_setting = LinkedinOauthSetting.find_by_user_id(current_user.id)
  		client = LinkedIn::Client.new('iv6uehul4g5m', 'wtMfG2MbFerSULTC', @@config)
  		client.authorize_from_access(linkedin_oauth_setting.atoken, linkedin_oauth_setting.asecret)
  		client
	end

	def index
  		unless LinkedinOauthSetting.find_by_user_id(current_user.id).nil?
    	redirect_to "/linkedin_profile"
 	    end
	end

	def linkedin_profile
  		basic_profile = get_basic_profile
  		full_profile = get_full_profile
  		positions = get_positions
  		educations = get_educations
	end
end




