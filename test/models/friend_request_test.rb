require 'test_helper'

class FriendRequestTest < ActiveSupport::TestCase
  def setup
    @binh = users(:binh)
    @xuan = users(:xuan)
  end

  test "can add friends and reverse friends" do
    @binh.befriend(@xuan)
    assert @xuan.isfriend(@binh)
  end

  test "can destroy friend and reverse" do
    @binh.befriend(@xuan)
    @xuan.unfriend(@binh)
    assert_not @binh.isfriend(@xuan)
  end
end