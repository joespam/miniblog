class PostsController < ApplicationController
	def create
		post = user_params.dup
		post[:user_id] = session[:user_id]
		@post = Post.new post
		@post.save
		redirect_to post_path(session[:user_id])
	end
	def destroy
		post = Post.find_by_id params[:id]

		if post.destroy
		 flash[:notice] = "Post deleted successfully."
		else
		 flash[:alert] = "There was a problem deleting the user."
		end
		redirect_to post_path(session[:user_id])
	end
	def edit
		@post = Post.find_by_id params[:id]
	end
	def index
		@posts = Post.all
	end
	def new
		@post = Post.new
	end	
	def show
		@post = Post.find params[:id]
		@comments = @post.comments
	end
	def update
		post = Post.find_by_id params[:id]
		if post and post.update_attributes user_params
			flash[:notice] = "Post updated successfully"
			redirect_to post_path(session[:user_id])
		else
			flash[:alert] = "Post Updating failed."
			redirect_to edit_post_path(params[:id])
		end
	end

	private
		def user_params
			params.require(:post).permit(:title, :body, :user_id)
		end

end