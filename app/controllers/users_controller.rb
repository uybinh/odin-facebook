class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def friends
    @friends = User.find(params[:id]).friends
  end
end
