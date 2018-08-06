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
  binh.posts[n].comments.create(content: Faker::Lorem.sentence, author_id: binh.id )
  binh.posts[n].comments.create(content: Faker::Lorem.sentence, author_id: binh.id)
  xuan.posts[n].comments.create(content: Faker::Lorem.sentence, author_id: xuan.id)
  xuan.posts[n].comments.create(content: Faker::Lorem.sentence, author_id: xuan.id)
end

binh.posts.first.image.attach(io: File.open("/Users/uybinh/Pictures/wallpaper/yosemite-2880x1800-5k-4k-wallpaper-8k-winter-snow-forest-osx-apple-3945.jpg"), filename: "mountain.jpg", content_type: "image/jpg")
