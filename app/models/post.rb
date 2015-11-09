class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments

	validates_presence_of :user_id
	validates_presence_of :body	
	validates_presence_of :title	

	before_validation :post_pre_check

	def post_pre_check
		puts "------------------ #{@title} #{@body} ---------------------"
	end 
end
