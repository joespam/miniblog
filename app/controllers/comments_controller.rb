class CommentsController < ApplicationController
	def new
		@com = Comment.new
		@post_id = params[:post_id]
	end
	def create
		comment = user_params.dup
		comment[:post_id] = params[:post_id]
		comment[:user_id] = session[:user_id]
		Comment.create comment
		redirect_to post_path params[:post_id]
#		redirect_to user_path session[:user_id]
	end

	private
	def user_params
		params.require(:comment).permit(:body, :user_id, :post_id)
	end	
end