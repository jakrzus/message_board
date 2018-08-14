# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'
require 'database_cleaner'

DatabaseCleaner.clean_with(:truncation)

10.times do
  email = Faker::Internet.email
  password = 'qwertyqwerty'

  user = User.new
  user.email = email
  user.password = password
  user.password_confirmation = password
  user.save!
  10.times do
    title = Faker::Lorem.sentence
    tekst = Faker::Lorem.paragraphs

    post = user.posts.new
    post.title = title
    post.tekst = tekst
    post.save!
    10.times do
      comment = Faker::Lorem.paragraphs
      reply = post.replies.new
      reply.comment = comment
      reply.user = user
      reply.save!
    end
  end
end
