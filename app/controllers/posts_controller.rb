class PostsController < ApplicationController
  def show

  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path
    else
      render "singlepages/home"
    end
  end

  def edit

  end

  def update

  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to request.referer
  end

  private

    def post_params
      params.require(:post).permit(:content)
    end
end
