require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    sign_in users(:binh)
    get users_path
    assert_response :success
  end

end
