module PostsHelper
	# return username based on post id
	def username_of_post post_id
		post = Post.find_by_id(post_id)
		return post.username
	end
end
