class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy,
                                        :connected, :connections]

  def index
  end

  def show
    @user = User.find(params[:id])
  end


  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user= User.new(user_params)
    p @user
    if @user.save
      session[:user_id] = @user.id
      redirect_to events_by_user_path
    else
      render 'new'
    end
  end



  def destory
  end

  def update
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :company_name, :phone, :job_title, :contact_by, :bio, :password, :password_confirmation)
  end
end
