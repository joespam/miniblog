module CommentsHelper
	def comment_author_fullname_link comment_id
		comment = Comment.find comment_id
		pp comment
		puts comment_id
		pp comment.user
		puts "----------------------------------------"
		user = comment.user
		return link_to "#{user.fname} #{user.lname}", user_path(user.id)
	end

end
