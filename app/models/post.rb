class Post < ApplicationRecord
  validates :content, presence: true

  belongs_to :author, class_name: "User"
end
