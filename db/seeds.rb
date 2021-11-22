# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

@users       = []
@posts       = []
@post_images = []
@password = BCrypt::Password.create(123456)

(1..10).each {
    @users.push({
                    :name       => Faker::Name.unique.name,
                    :username   => Faker::Internet.unique.username,
                    :email      => Faker::Internet.unique.email,
                    :password   => @password,
                    :created_at => Date.current,
                    :updated_at => Date.current,
                })
}

@index = 0
(1..100).each do |item|
    @post_title = Faker::Mountain.name + ' ' + Faker::Nation.capital_city + ' ' + Faker::Nation.flag

    @posts.push({
                    :title      => @post_title,
                    :content    => Faker::Lorem.sentence(word_count: rand(1000..2000)),
                    :slug       => @post_title.parameterize + (@index += 1).to_s,
                    :created_at => Date.current,
                    :updated_at => Date.current,
                    :users_id   => rand(1..10),
                })

    @post_images.push({
                          :name       => Faker::LoremFlickr.image,
                          :created_at => Date.current,
                          :updated_at => Date.current,
                          :posts_id   => rand(1..99),
                      })
end

@users.each_slice(300) do |each|
    User::User.insert_all!(each)

    puts 'User inserted successfully'
end

@posts.each_slice(500) do |each|
    Post::Post.insert_all!(each)

    puts 'Post inserted successfully'
end

@post_images.each_slice(500) do |each|
    Post::Image.insert_all!(each)

    puts 'Post images inserted successfully'
end