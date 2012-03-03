class PostsController < ApplicationController
  def new
    @post = User.find(params[:user_id]).blog.posts.new
  end

  def create
    User.find(params[:user_id]).blog.posts.create!(params[:post])
    redirect_to user_posts_path
  end

  def index
    @user = User.find(params[:user_id])
  end
end
