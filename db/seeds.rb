require 'faker'

User.create!(
  email: "binh@gmail.com",
  password: "password",
  password_confirmation: "password"
)

20.times do |n|
  User.create!(
    email: Faker::Internet.email,
    password: "password",
    password_confirmation: "password"
  )
end