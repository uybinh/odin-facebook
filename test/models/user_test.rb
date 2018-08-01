require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @binh = users(:binh)
  end

  test "should be valid" do
    assert @binh.valid?
  end
end
