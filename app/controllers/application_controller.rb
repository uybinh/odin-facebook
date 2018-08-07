class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :authenticate_user!

  # def set_current_user
  #   Current.user = current_user
  # end

  def current_user
    @current_user ||= super && User.includes(:requesting, :friends).find(@current_user.id)
  end

end
