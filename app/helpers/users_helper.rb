module UsersHelper
	#
	#  This tests whether an input userid
	#  matches the currently logged in user
   def is_logged_in userid

   	retval = true

		if session[:user_id].nil? 
			retval = false
		else 
			retval = userid == session[:user_id]
		end
	end

	def post_author post_id
		# return User.find_by_id( (Post.find_by_id post_id).user_id )
		return User.post post_id
	end

	def new_members
		User.signed_up_recently 2
	end

	# returns true if there are any new members
	#
	def any_new_members
		retval = false
		new_users = User.signed_up_recently 2
		retval = true if new_users.length > 0
		return retval
	end

	def user_link user
		link_text = if user == current_user
							'you'
						else
							"#{user.fname} #{user.lname}"
						end
	end

end