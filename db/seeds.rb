# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: "Miguel Prada", 
            email: "mapra99@gmail.com", 
            password: "password", 
            password_confirmation: "password",
            admin: true)

User.create(name: "Miguel Toto", 
            email: "inge.maps@gmail.com", 
            password: "password", 
            password_confirmation: "password",
            admin: false)

98.times do |i|
  i += 1
  name = Faker::Name.name
  email = "example#{i}@example.com"
  password = "password"

  User.create(name: name,
              email: email,
              password: password,
              password_confirmation: password,
              admin: false)
end