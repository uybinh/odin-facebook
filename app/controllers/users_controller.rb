class UsersController < ApplicationController
  def index
    # @users = User.all
  end

  def show
    @user = current_user
    @friends = @user.friends
    @friend_requests = @user.received_requests.pending
  end
end
