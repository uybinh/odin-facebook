class Timeline
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def posts
    @user.posts.includes(:author)
  end

  def friends
    @user.friends
  end
end