class ConnectionsController < ApplicationController

	def create

	end

	def show
	      # @event = Event.find(params[:id])
	      # @user = User.find(session[:user_id])
	end

	def not_connected_users
		@user_me  = User.find(params[:id])
		@event = Event.find(params[:id])
		@users = @event.users
	    @users_connect = @user.connected_users

	    @unconnected_user = []
	    @users.each do |user|
	    	@unconnected_user << user @users_connect.include?(user)
	    end
	    @unconnected_user.delete(@user_me)
	end

	def connected
	    @title = "Connected"
	    @user  = User.find(params[:id])
	    @users = @user.connected.paginate(page: params[:page])
	    render 'show_connected'
  	end

  def connections
    @title = "Connections"
    @user  = User.find(params[:id])
    @users = @user.connections.paginate(page: params[:page])
    render 'show_connection'
  end

end
