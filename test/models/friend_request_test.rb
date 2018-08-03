require 'test_helper'

class FriendRequestTest < ActiveSupport::TestCase
  def setup
    @binh = users(:binh)
    @xuan = users(:xuan)
  end

  test "can add friends and reverse friends" do
    @binh.friends << @xuan
    assert @xuan.friends.include? @binh
  end

  test "can destroy friend and reverse" do
    @binh.friends << @xuan
    @xuan.unfriend(@binh)
    assert_not @binh.friends.include? @xuan
  end
end