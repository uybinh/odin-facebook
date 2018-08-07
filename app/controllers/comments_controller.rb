class CommentsController < ApplicationController

  def index
    @comments = comments_of(Post.find(params[:post_id]))
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save

    respond_to do |format|
      format.html { redirect_to request.referer }
      format.js
    end

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

    def comment_params
      params.require(:comment).permit(:content, :author_id, :post_id)
    end
end
