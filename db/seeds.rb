# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

2.times do |n|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "nus#{n}@technology.com"
  password = "123456"
  user = User.create!(first_name: first_name, last_name: last_name,email: email, password: password, password_confirmation: password)
  unless user.nil?
    5.times do |n|
      title = Faker::Job.title
      description = Faker::Name.name
      user.photos.create!(title: title, description: description, share_mode: true)
    end
    5.times do |n|
      title = Faker::Job.title
      description = Faker::Name.name
      album = user.albums.create!(title: title, description: description, share_mode: true)
    end
  end
end

