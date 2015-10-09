module UsersHelper
	def user_list(user_id)
		user = Attendances.where(id: user_id).first
		render 'form', :first_name => first_name, :last_name => last_name
	end
end
