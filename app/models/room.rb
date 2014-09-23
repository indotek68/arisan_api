class Room < ActiveRecord::Base

	has_many :user_room
	has_many :users, :through => :user_room
	
	VALID_SCHEDULE = %w(Weekly weekly Bi-weekly bi-weekly Monthly monthly)

	validates :rm_name, presence: true, uniqueness: true
	validates :num_people, presence: true, inclusion: {in: 3...13}

	validates :cash_pot, presence: true, inclusion: {in: 100...1001}

	validates :schedule, presence: true, inclusion: {in: VALID_SCHEDULE}
end
