require 'test_helper'

class LoginUserTest < ActionDispatch::IntegrationTest
  test "login user" do
    get root_path
    follow_redirect!
    assert_template "devise/sessions/new"
    post user_session_path, params: { user: { email: "binh@gmail.com",
                                              password: "password",
                                              remember_me: 0
                                              }}
    follow_redirect!
    assert_template "singlepages/home"
  end
end
