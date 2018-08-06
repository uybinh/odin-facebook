class FriendRequestsController < ApplicationController

  def update
    @request = FriendRequest.find(params[:id])
    @request.toggle!(:accepted)
    redirect_to request.referer
  end

  def create
    @request = FriendRequest.new(requester: current_user, requested: User.find(params[:id]))
    @request.save
    redirect_to users_path
  end

  def destroy
    @request = FriendRequest.find_by(requester: current_user, requested: User.find(params[:id]))
    @request.destroy
    redirect_to users_path
  end

  def accept
    other_user = User.find(params[:id])
    @request = FriendRequest.find_by(requester: other_user, requested: current_user)
    current_user.befriend(other_user)
    redirect_to root_path
  end

  def unaccept
    @request = FriendRequest.find_by(requester: User.find(params[:id]), requested: current_user)
    @request.destroy
    redirect_to request.referer
  end

end
