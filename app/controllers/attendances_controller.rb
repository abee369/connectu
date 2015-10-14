class AttendancesController < ApplicationController

	def index
	  @attendances = Attendance.all

	end  

	def show
		@user = User.find(session[:user_id])
		@events = @user.events
	  @attendance = Attendance.find(params[:id])
	end

	def new 
	  @attendance = Attendance.new 
	end

	def edit
	  @attendance = Attendance.find(params[:id])
	end

	def create
	  @attendance = Attendance.new(attendance_params)
	  @attendance.user = User.find(session[:user_id])

	  if @attendance.save
	  redirect_to events_by_user_path
	  else
	    render 'new' 
	  end
	end

	def update
	  @attendance = Attendance.find(params[:id])

	  if @attendance.update(attendance_params)
	    redirect_to @attendance
	  else
	    render 'edit'
	  end
	end

	def destroy
	  @attendance = Attendance.find(params[:id])
	  @attendance.destroy
	  redirect_to events_by_user_path
	end

private


def attendance_params
 params.require(:attendance).permit(:event_id, :user_id, :reason, :host)
end
# def user_params
#  params.require(:user).permit(:user_id)
# end

end

  # @event = Event.new(event_params)
  # @attendance = Attendance.new(attend_params)

  # if @event.save
  #  redirect_to @event
  # else
  #   render 'new' 
  # end
