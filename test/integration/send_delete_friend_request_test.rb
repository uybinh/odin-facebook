require 'test_helper'

class SendFriendRequestTest < ActionDispatch::IntegrationTest
  def setup
    @binh = users(:binh)
    @xuan = users(:xuan)
  end
  test "send/delete friend request" do
    sign_in @binh
    get users_path
    assert_difference "FriendRequest.count", 1 do
      post send_request_user_path(@xuan)
    end
    assert_difference "FriendRequest.count", -1 do
      delete delete_request_user_path(@xuan)
    end
  end

end
