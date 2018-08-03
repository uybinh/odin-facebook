require 'faker'

binh = User.create(
  email: "binh@gmail.com",
  password: "password",
  password_confirmation: "password"
)

xuan = User.create(
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

5.times do
  Post.create!(content: Faker::Lorem.paragraph(2, true, 4), author: binh)
end

5.times do
  Post.create!(content: Faker::Lorem.paragraph(2, true, 4), author: xuan)
end