class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

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

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to posts_path
    else
      redirect_to posts_path
    end
  end
  
  private

  def post_params
    params.require(:post).permit(:image, :title, :category_id, :text).merge(user_id: current_user.id)
  end

  def set_item
    @post = Post.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless @post.user == current_user
  end
end