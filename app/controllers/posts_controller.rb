class PostsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:image, :title, :category_id, :text).merge(user_id: current_user.id)
  end
end
