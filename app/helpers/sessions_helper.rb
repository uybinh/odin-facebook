module SessionsHelper

  def after_sign_in_path_for(resource)
    current_user_path
  end

end