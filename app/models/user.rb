class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :received_requests,  class_name: "FriendRequest",
                                foreign_key: "requested_id",
                                dependent: :destroy

  has_many :pending_requests,   -> { where(accepted: false)},
                                class_name: "FriendRequest",
                                foreign_key: "requested_id",
                                dependent: :destroy

  has_many :sent_requests,      class_name: "FriendRequest",
                                foreign_key: "requester_id",
                                dependent: :destroy

  has_many :requesters,     through: :received_requests,
                            source: :requester
  has_many :requesting,     through: :sent_requests,
                            source: :requested


  has_many :friendships,          -> { where(accepted: true)},
                                  class_name: "FriendRequest",
                                  foreign_key: "requested_id",
                                  dependent: :destroy

  has_many :reversed_friendships, -> { where(accepted: true)},
                                  class_name: "FriendRequest",
                                  foreign_key: "requester_id",
                                  dependent: :destroy

  has_many :friends,          through: :friendships,
                              source: :requester
  has_many :reversed_friends, through: :reversed_friendships,
                              source: :requested

  def all_friends
    self.friends + self.reversed_friends
  end
end
