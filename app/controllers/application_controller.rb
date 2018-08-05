class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :authenticate_user!, :set_current_user

  def set_current_user
    Current.user = current_user
  end

end
