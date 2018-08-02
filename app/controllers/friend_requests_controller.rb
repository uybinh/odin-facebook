class FriendRequestsController < ApplicationController

  def update
    @request = FriendRequest.find(params[:id])
    @request.toggle!(:accepted)
    redirect_to request.referer
  end

  def destroy

  end

  def unfriend
    @request = FriendRequest.find(params[:id])
    @request.toggle!(:accepted)
    redirect_to request.referer
  end
end
