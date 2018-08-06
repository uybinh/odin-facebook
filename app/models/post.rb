class Post < ApplicationRecord
  # active storage already have with_attached_image (or with_attached_your_attachment_name) which includes the associated blobs.
  # But what if you want to use eager_load or preload instead of includes
  # scope :includes_images, -> { eader_load(image_attachment: :blob)}
  # scope :includes_images, -> { preload(image_attachment: :blob)}
  default_scope { order(created_at: :desc) }
  scope :with_author, -> { includes(:author)}
  validates :content, presence: true

  belongs_to :author, class_name: "User"
  has_many :comments, as: :commentable, dependent: :destroy
  has_one_attached :image

end