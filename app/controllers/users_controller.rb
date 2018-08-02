class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = current_user
    @friends = @user.all_friends
    @friend_requests = @user.pending_requests
  end
end
