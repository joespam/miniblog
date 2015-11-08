class CommentsController < ApplicationController
	def new
		@com = Comment.new
		@post_id = params[:post_id]
	end
	def create
		comment = comment_params.dup
		comment[:post_id] = params[:post_id]
		comment[:user_id] = session[:user_id]
		new_comment = Comment.create comment
		new_comment.save
		redirect_to post_path params[:post_id]
#		redirect_to user_path session[:user_id]
	end
	def edit
		@comment = Comment.find params[:id]

	end

	def update
		comment = Comment.find params[:id]
		post = comment.post
		if comment and comment.update_attributes comment_params.dup
			flash[:notice] = "Comment updated successfully"
			redirect_to post_path post.id
		else
			flash[:alert] = "Updating failed."
			redirect_to edit_post_comment_path post.id, comment.id
		end			
	end

	private
	def comment_params
		params.require(:comment).permit(:body, :user_id, :post_id)
	end	
end