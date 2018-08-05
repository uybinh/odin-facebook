class TimelinesController < ApplicationController

  def show
    @timeline = params[:id] ? Timeline.new(User.find(params[:id])) : Timeline.new(current_user)
  end

end
