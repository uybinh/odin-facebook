require 'test_helper'

class FriendRequestTest < ActiveSupport::TestCase
  def setup
    @binh = users(:binh)
    @xuan = users(:xuan)
  end

  test "send friend request" do
    @xuan.friend_request(@binh)
    assert @binh.requesters.include? @xuan
  end
end