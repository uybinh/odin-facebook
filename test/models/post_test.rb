require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @post = posts(:one)
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "should have content" do
    @post.content = ""
    assert_not @post.valid?
    @post.content = "      "
    assert_not @post.valid?
  end

end
