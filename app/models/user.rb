class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :received_requests,  class_name: 'FriendRequest',
                                foreign_key: 'requested_id',
                                dependent: :destroy

  # has_many :pending_requests,   -> { pending },
  #                               class_name: 'FriendRequest',
  #                               foreign_key: 'requested_id',
  #                               dependent: :destroy

  has_many :sent_requests,      class_name: 'FriendRequest',
                                foreign_key: 'requester_id',
                                dependent: :destroy


  has_many :requesters,     through: :received_requests,
                            source: :requester
  has_many :requesting,     through: :sent_requests,
                            source: :requested

  has_many :friendships, dependent: :destroy
  delegate :befriend, :unfriend, to: :friendships
  delegate :remove_friend_request, to: :received_requests

  has_many :friends, through: :friendships

  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'

  scope :is_requested_by, -> { includes(:requesting)}

  def isfriend(friend)
    friends.include?(friend)
  end

  def pending_requests
    received_requests.pending
  end

  def pending_requesters
    requesters.where('friend_requests.accepted = FALSE')
  end

  def is_requested_by(user)
    requesting.include?(user)
  end

  def posts_with_author
    posts.with_author
  end

end
