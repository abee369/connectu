class ConnectionsController < ApplicationController

	def create
		
	end

	def show
	      # @event = Event.find(params[:id])
	      # @user = User.find(session[:user_id])
	      # @users = @user.connected_users
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
