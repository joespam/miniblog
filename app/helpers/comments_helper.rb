module CommentsHelper
	def comment_author_fullname_link comment_id
		comment = Comment.find comment_id
		
		user = comment.user
		return link_to "#{user.fname} #{user.lname}", user_path(user.id)
	end

	def can_comment comment_id
		comment = Comment.find comment_id
		user = comment.user
		post = comment.post
		return session[:user_id] == user.id ||
				session[:user_id] == post.user_id
	end

end
