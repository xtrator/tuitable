# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'started seeding users'
thanos = User.create(email: 'thanos@gauntlet.com', password: 'thanos', name: 'The Great Tanus', username: 'tanus')
goku = User.create(email: 'goku@dragonball.com', password: 'vegeta', name: 'Son Goku', username: 'goku2000')
dogfire = User.create(email: 'dogfire@dogfire.com', password: 'thisisfine', name: 'House on Fire', username: 'dogfire')
puts 'finished seeding users'

puts 'started seeding tweets'
thanos_tweet = thanos.tweets.create(body: Faker::Lorem.sentence( word_count: rand(15..16)) )
goku_tweet = goku.tweets.create(body: Faker::Lorem.sentence( word_count: rand(15..16)) )
dogfire_tweet = dogfire.tweets.create(body: Faker::Lorem.sentence( word_count: rand(15..16)) )
puts 'finished seeding tweets'

puts 'started seeding likes'
Like.create(user: thanos, tweet: thanos_tweet )
Like.create(user: thanos, tweet: dogfire_tweet )
Like.create(user: goku, tweet: thanos_tweet )
Like.create(user: goku, tweet: goku_tweet )
Like.create(user: goku, tweet: dogfire_tweet )
Like.create(user: dogfire, tweet: thanos_tweet )
puts 'finished seeding likes'

puts 'started seeding replies'
30.times do
  user = User.all.sample
  Tweet.all.sample.replies.create( body: Faker::Lorem.sentence( word_count: rand(5..12) ), user: user)
end
puts 'finished seeding replies'

puts 'started seeding avatars'
thanos.avatar.attach(io: File.open('app/assets/images/thanos.png'), filename: 'thanos.png')
goku.avatar.attach(io: File.open('app/assets/images/goku.png'), filename: 'goku.png')
dogfire.avatar.attach(io: File.open('app/assets/images/dogfire.png'), filename: 'dogfire.png')
puts 'finished seeding avatars'
