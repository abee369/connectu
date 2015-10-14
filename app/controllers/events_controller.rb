class EventsController < ApplicationController


def index
    @events = Event.all

    # @attendance = Attendance.new
    # @user = User.find(session[:user_id])
    # @event = Attendance.map 
    # @event = @user.events
end

def index_by_user
    @user = User.find(session[:user_id])
  end  
def show
  @event = Event.find(params[:id])
  @event_attendees = @event.attendances
  @user = User.find(session[:user_id])

end

def new 
  @event = Event.new 
end

def edit
  @event = Event.find(params[:id])
end

def create
  @event = Event.new(event_params)
  @attendance = Attendance.create

  if @event.save
   redirect_to @event
  else
    render 'new' 
  end

  # if @attendance.save
  #  redirect_to @attendance
  # else
  #   render 'index_by_user' 
  # end

end

def update
  @event = Event.find(params[:id])

  if @event.update(event_params)
    redirect_to @event
  else
    render 'edit'
  end
end

def destroy
  @event = Event.find(params[:id])
  @event.destroy

  redirect_to events_path
end

  private
  def event_params
     params.require(:event).permit(:event_title, :location, :date, :description)
  end

  # def attend_params
  #   params.require(:attendance).permit(:user_id)
  # end



end
