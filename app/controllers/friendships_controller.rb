class FriendshipsController < ApplicationController
  after_action :remove_friend_request, only: :create

  def create
    @other_user = User.find(params[:id])
    @current_user.befriend(@other_user)
    redirect_to root_path
  end

  private
    def remove_friend_request
      current_user.remove_friend_request(@other_user)
    end
end
