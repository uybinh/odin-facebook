class FriendRequest < ApplicationRecord
  belongs_to :requester, class_name: "User"
  belongs_to :requested, class_name: "User"
  scope :pending, -> { where(accepted: false) }
  scope :accepted, -> { where(accepted: true) }

  def self.friend_request(user)
    create(requested: user)
  end
end
