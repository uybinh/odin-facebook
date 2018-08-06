class FriendRequest < ApplicationRecord
  belongs_to :requester, class_name: "User"
  belongs_to :requested, class_name: "User"
  scope :pending, -> { where(accepted: false) }
  scope :accepted, -> { where(accepted: true) }
  validate :self_request

  def self.friend_request(user)
    create(requested: user)
  end

  def self.remove_friend_request(user)
    find_by(requester: user).destroy
  end

  private
    def self_request
      unless (requester_id != requested_id)
        errors[:self_request] << "Users can't send request to themselves"
      end
    end

end
