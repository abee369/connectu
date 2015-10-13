class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to events_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'sessions/new'
    end

  end

  def linkedin
    begin
      @user = User.from_omniauth(request.env['omniauth.auth'])
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.name}!"
    rescue
      flash[:warning] = "There was an error while trying to authenticate you..."
    end
    redirect_to root_path
  end

  def auth_failure
    redirect_to root_path
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
