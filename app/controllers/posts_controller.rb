class PostsController < ApplicationController
  def index
    @posts = Post.all.order("created_at DESC")
  end

  private

  def post_params
    params.require(:post).permit(:image).merge(user_id: current_user.id)
  end
end
