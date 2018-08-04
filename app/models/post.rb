class Post < ApplicationRecord
  validates :content, presence: true

  belongs_to :author, class_name: "User"
  has_many :comments, as: :commentable, dependent: :destroy
  has_one_attached :image

  def attached_image
    image.attached? ? image : ""
  end
end