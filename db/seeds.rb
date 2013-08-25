# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'


def create_posts(num_of_posts = 10)
  
  num_of_posts.times do 
    Post.create({title: Faker::Company.catch_phrase,
                 body: Faker::Lorem.paragraph})
  end
end

create_posts(10)

Post.all.each do |post|
  post.tags.create({name: Faker::Commerce.product_name})
end

