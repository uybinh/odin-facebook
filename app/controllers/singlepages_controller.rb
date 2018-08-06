class SinglepagesController < ApplicationController

  def home
    @user = current_user
    render layout: "timeline"
  end

end
