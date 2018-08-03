class Timeline
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def posts
    @user.posts
  end

  def friends
    @user.friends
  end
end