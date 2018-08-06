class CommentsController < ApplicationController

  def index
    @comments = comments_of(Post.find(params[:post_id]))
  end

  def create
  end

  def show

  end

  def update

  end

  def destroy

  end

  private
    def comments_of(post)
      post.comments
    end
end
