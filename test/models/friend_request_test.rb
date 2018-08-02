require 'test_helper'

class FriendRequestTest < ActiveSupport::TestCase
  def setup
    @binh = users(:binh)
    @xuan = users(:xuan)
  end

  test "can add friends and reverse friends" do
    @binh.friends << @xuan
    assert @xuan.all_friends.include? @binh
  end
end
