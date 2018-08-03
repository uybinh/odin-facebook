require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest

  test "should create new post when signed in" do
    sign_in users(:binh)
    # with valid params
    assert_difference "Post.count", 1 do
      post posts_path, params: { post: {content: "hello world"}}
    end
    follow_redirect!
    assert_template "timelines/show"
    # with invalid prarams
    assert_no_difference "Post.count" do
      post posts_path, params: { post: {content: "     "}}
    end
  end

  test "should redirect when create new post without signing in" do
    assert_no_difference "Post.count" do
      post posts_path, params: { post: {content: "hello world"}}
    end
    follow_redirect!
    assert_template "devise/sessions/new"
  end

  test "delete post without signed in" do
    @post = posts(:one)
    assert_no_difference "Post.count" do
      delete post_path(@post)
    end
  end

  test "delete post with signed in" do
    @post = posts(:one)
    sign_in users(:binh)
    assert_difference "Post.count", -1 do
      delete post_path(@post)
    end
  end

end
