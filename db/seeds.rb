# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(name: "Miguel Prada", 
                  email: "mapra99@gmail.com", 
                  password: "password", 
                  password_confirmation: "password",
                  admin: true,
                  activated: true)

50.times do
  content = Faker::Movie.quote
  user.microposts.create!(content: content)
end

User.create(name: "Miguel Toto", 
            email: "inge.maps@gmail.com", 
            password: "password", 
            password_confirmation: "password",
            admin: false,
            activated: false)

98.times do |i|
  i += 1
  name = Faker::Movies::LordOfTheRings.character
  email = "example#{i}@example.com"
  password = "password"

  user = User.create(name: name,
                    email: email,
                    password: password,
                    password_confirmation: password,
                    admin: false,
                    activated: true)

  if i <= 6
    50.times do
      content = Faker::Movie.quote
      user.microposts.create!(content: content)
    end
  end
end