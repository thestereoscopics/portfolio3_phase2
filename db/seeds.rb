require 'faker'

user = User.new(name: "Bennifer", email: "the@best.net")
user.password = "best"
user.save

user = User.new(name: "Sasquatch Phil", email: "the@yikes.net")
user.password = "best2"
user.save
# create a few users

#TODO: Once you have implemented BCrypt - you can use these to seed your database.


# User.create :name => 'Dev Bootcamp Student', :email => 'me@example.com', :password => 'password'
# 5.times do
#   User.create :name => Faker::Name.name, :email => Faker::Internet.email, :password => 'password'
# end
