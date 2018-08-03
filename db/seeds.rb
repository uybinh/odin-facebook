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

5.times do |n|
  binh.posts[n].comments.create(content: Faker::Lorem.sentence)
  binh.posts[n].comments.create(content: Faker::Lorem.sentence)
  xuan.posts[n].comments.create(content: Faker::Lorem.sentence)
  xuan.posts[n].comments.create(content: Faker::Lorem.sentence)
end