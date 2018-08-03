class UsersController < ApplicationController
  def index
    # @users = User.all
  end

  def show
    @user = current_user
    @friends = @user.friends
    @friend_requests = @user.pending_requests
  end

  def friends
    @friends = User.find(params[:id]).friends
  end
end
