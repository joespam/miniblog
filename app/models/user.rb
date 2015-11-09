class User < ActiveRecord::Base
	has_many :posts
	has_many :comments

	validates_presence_of :fname
	validates_presence_of :lname
	validates_presence_of :username
	validates_presence_of :password
	validates :email, presence: true, uniqueness: true

	scope :signed_in_today, -> {   
		where('last_sign_in between ? and ?', Time.now-1.day, Time.now) 
	}

	# User.signed_in_today in a helper

	scope :signed_up_recently, -> (days_ago = 5) {   
		where('created_at between ? and ?', Time.now-days_ago.days, Time.now) 
	}
	scope :signed_up_today, -> (days_ago = 1) {   
		where('created_at between ? and ?', Time.now-days_ago.days, Time.now) 
	}

end
