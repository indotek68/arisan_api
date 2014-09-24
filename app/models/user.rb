class User < ActiveRecord::Base

	has_secure_password

	has_many :user_room
	has_many :rooms, :through => :user_room

	validates :firstname, presence: true, :length => {:minimum => 2}
	validates :lastname, presence: true, :length => {:minimum => 2}
	validates :email, presence: true, uniqueness: {case_sensitive: false}
	
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

	validates :password, :presence => true, :length => {:minimum => 6}, on: :create

	def self.authenticate email, password
		User.find_by_email(email).try(:authenticate,password)
	end
end