# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# require 'ffaker'

# 7.times do
#   User.new.tap do |u|
#   	u.firstname = Faker::Name.first_name
#   	u.lastname = Faker::Name.last_name
#   	u.image_url = "http://i.imgur.com/4f1r998.png"
#     u.email = Faker::Internet.email
#     u.password = 'password'
#     u.description = Faker::HipsterIpsum.paragraph
#     u.reputation = 0
#     u.save!
#   end
# end

# 7.times do
# 	Room.new.tap do |r|
# 		r.rm_name = Faker::Product.brand  + " room"
# 		r.num_people = Random.rand(3...12)
# 		r.cash_pot = Random.rand(100...1000)
# 		r.schedule = "Monthly"
# 		r.save!
# 	end
# end

# Room.find(1).users << User.find(5)
# Room.find(1).users << User.find(9)
# Room.find(1).users << User.find(8)

# Room.find(2).users << User.find(5)
# Room.find(2).users << User.find(6)
# Room.find(2).users << User.find(7)
# Room.find(2).users << User.find(8)
# Room.find(2).users << User.find(9)
# Room.find(2).users << User.find(10)
# Room.find(2).users << User.find(11)
# Room.find(2).users << User.find(12)

# Room.find(3).users << User.find(12)
# Room.find(3).users << User.find(13)
# Room.find(3).users << User.find(9)
# Room.find(3).users << User.find(14)

# Room.find(4).users << User.find(5)
# Room.find(4).users << User.find(11)
# Room.find(4).users << User.find(12)
# Room.find(4).users << User.find(14)

#  


# UserRoom.where(:room_id => 1).update_all(host_id: 5)
# UserRoom.where(:room_id => 2).update_all(host_id: 6)
# UserRoom.where(:room_id => 3).update_all(host_id: 12)
# UserRoom.where(:room_id => 4).update_all(host_id: 5)
# UserRoom.where(:room_id => 5).update_all(host_id: 6)
# UserRoom.where(:room_id => 6).update_all(host_id: 7)
# UserRoom.where(:room_id => 7).update_all(host_id: 8)
# UserRoom.where(:room_id => 8).update_all(host_id: 9)
# UserRoom.where(:room_id => 9).update_all(host_id: 10)
# UserRoom.where(:room_id => 10).update_all(host_id: 11)





