class UsersController < ApplicationController
	def create
		user = User.new(user_params.dup)
		if (user.save) 
			flash[:notice] = "Your account was created successfully"
			redirect_to users_path
		else
			flash[:alert] = "There was a problem saving your account"
			@user = user
			render :new
		end
	end
	def destroy
		user = User.find_by_id params[:id]

		if user.destroy
		 flash[:notice] = "User deleted successfully."
		else
		 flash[:alert] = "There was a problem deleting the user."
		end
		redirect_to users_path
	end
	def edit
		@user = User.find_by_id params[:id]
	end
	def index
		@users = User.all
	end
	def new
		@user = User.new
	end
	def show
		user = User.find_by_id params[:id]
		@posts = user.posts
	end
	def update
		# puts "Params follow:"
		# pp params

		user = User.find params[:id]
		if user and user.update_attributes user_params
			flash[:notice] = "Account updated successfully"
			redirect_to users_path user
		else
			flash[:alert] = "Updating failed."
			redirect_to edit_user_path user
		end		
	end

	private
		def user_params
			params.require(:user).permit(:fname, :lname, :username, :password, :email)
		end
end