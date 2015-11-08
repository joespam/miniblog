class SessionsController < ApplicationController

	#processes data from login form
	def create
		@user = User.where(username: params[:login]).first
		# if user didn't enter a valid username, check
		# if they entered a valid email

		#
		# if !@user
		if @user.nil?
			@user = User.where(email: params[:login]).first
		end

		# Now check for user password
		#
		if @user && @user.password == params[:password]
			session[:user_id] = @user.id
			current_user
			flash[:notice] = "You have logged in successfully."
			redirect_to post_path(session[:user_id])
		else 
			flash[:alert] = "invalid user name or email #{params[:login]}"
			redirect_to login_path
		end
	end

	#route for logging out a user
	def destroy
		session[:user_id] = nil
		flash[:notice] = "You have logged out."
		redirect_to users_path
	end

	#route for login form
	def new
		flash[:notice] = ""
		flash[:alert] = ""
		@login = ""
	end
end