class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path
    else
      # Change this to suitable view
      redirect_to root_path
    end
  end

  def edit

  end

  def update

  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  private

    def post_params
      params.require(:post).permit(:content)
    end
end
