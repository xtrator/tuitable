# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
sentence = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque interdum rutrum sodales. Nullam mattis fermentum libero, non volutpat.'

puts 'started seeding users'
thanos = User.create(email: 'thanos@gauntlet.com', password: 'thanos', name: 'The Great Tanus', username: 'tanus')
goku = User.create(email: 'goku@dragonball.com', password: 'vegeta', name: 'Son Goku', username: 'goku2000')
dogfire = User.create(email: 'dogfire@dogfire.com', password: 'thisisfine', name: 'House on Fire', username: 'dogfire')
puts 'finished seeding users'

puts 'started seeding tweets'
thanos.tweets.create(body: sentence )
goku.tweets.create(body: sentence )
dogfire.tweets.create(body: sentence )
puts 'finished seeding tweets'

# puts 'started seeding comments'
# rand(1..3).times do 
#   Tweet.first.comments.create(body: sentence, user: User.all.sample)
# end
# rand(1..3).times do 
#   Tweet.second.comments.create(body: sentence, user: User.all.sample)
# end
# rand(1..3).times do 
#   Tweet.third.comments.create(body: sentence, user: User.all.sample)
# end
# puts 'finished seeding comments'

# puts 'started seeding images'
# thanos.avatar.attach(io: File.open('app/assets/images/thanos.png'), filename: 'thanos.png')
# goku.avatar.attach(io: File.open('app/assets/images/goku.png'), filename: 'goku.png')
# dogfire.avatar.attach(io: File.open('app/assets/images/dogfire.png'), filename: 'dogfire.png')
# puts 'finished seeding images'
