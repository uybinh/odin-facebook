class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :received_requests,  class_name: "FriendRequest",
                                foreign_key: "requested_id",
                                dependent: :destroy


  has_many :sent_requests,      class_name: "FriendRequest",
                                foreign_key: "requester_id",
                                dependent: :destroy

  has_many :requesters,     through: :received_requests,
                            source: :requester
  has_many :requesting,     through: :sent_requests,
                            source: :requested
  has_many :friendships

  has_many :friends, through: :friendships

  def unfriend(friend)
    friendships.find_by(friend: friend).destroy
  end

end
