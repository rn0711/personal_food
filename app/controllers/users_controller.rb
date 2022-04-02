class UsersController < ApplicationController
  def show
    @nickname = currentuser.nickname
    @posts = currentuser.posts
  end
end
