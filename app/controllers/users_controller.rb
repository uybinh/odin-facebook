class UsersController < ApplicationController
  def index
    @users = User.includes(:requesting).all
  end

  def show
    @user = User.includes(:posts).find(params[:id])
  end

  def friends
    @friends = User.find(params[:id]).friends
  end

  def requesters
    @requesters = User.find(params[:id]).pending_requesters
  end

end
