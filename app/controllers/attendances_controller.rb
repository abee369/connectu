class AttendancesController < ApplicationController
	def index
	    @attendance = Attendance.all
	  end  
	def show
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

	  if @attendance.save
	   redirect_to @attendance
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

	  redirect_to attendances_path
	end

private
def attendance_params
 params.require(:attendance).permit(:first_name, :last_name)
end



end
