class Friendship < ApplicationRecord
  after_create :create_reverse_friendship
  after_destroy :destroy_reverse_friendship
  belongs_to :user
  belongs_to :friend, class_name: "User"
  validates :user,   presence: true
  validates :friend, presence: true, uniqueness: { scope: :user }

  def create_reverse_friendship
    friend.friendships.create(friend: user)
  end

  def destroy_reverse_friendship
    friendship = friend.friendships.find_by(friend: user)
    friendship.destroy if friendship
  end
end
