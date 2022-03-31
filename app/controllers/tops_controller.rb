class TopsController < ApplicationController
  def index
    @posts = Post.order("created_at DESC").limit(4)
  end
end
