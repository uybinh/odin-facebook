class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = current_user
    @friends = @user.all_friends
    @requesters = @user.pending_requests.map { |request| request.requester }
  end
end
