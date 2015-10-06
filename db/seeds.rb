# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



abhi_details = {    :first_name     => "Abhi",
                     :last_name       => "Kon",
                     :email         => "abee369@hotmail.com",
                     :phone           => "1233422345",
                     :company_name        => "rails",
                     :job_title		   => "The Boss",
                     :bio     => "Learning coding now!",
                     :contact_by => 3,
                     :password_digest => "sdfsdfew"
                 }

abhi_atten = {       :user_id     => 1,
                     :event_id   => 1,
                     :host =>true,
                     :reason =>1
                 }

abhi_connection = {  :connected_user_id     => 1,
                     :attendance_id   => 1
                 }

new_event = { :event_title => "Party!!!",
	          :description => "to do homework",
	          :location => "1647 Blue Island, Chicago IL",
	          :date => "10/04/2015 17:00"
}

User.create(abhi_details)
Attendance.create(abhi_atten)
Connection.create(abhi_connection)
Event.create(new_event)


