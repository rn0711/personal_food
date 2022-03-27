class PostsController < ApplicationController
  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  private

  def post_params
    params.require(:post).permit(:image, :title, :category_id, :text).merge(user_id: current_user.id)
  end
end
