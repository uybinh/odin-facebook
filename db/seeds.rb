require 'faker'

User.create(
  email: "binh@gmail.com",
  password: "password",
  password_confirmation: "password"
)

User.create(
  email: "xuan@gmail.com",
  password: "password",
  password_confirmation: "password"
)

20.times do |n|
  User.create(
    email: Faker::Internet.email,
    password: "password",
    password_confirmation: "password"
  )
end

10.times { Post.create!(content: Faker::Lorem.paragraph(2, true, 4) ) }