class UsersController < ApplicationController
  def new
    @user = User.new
    @user.build_blog
  end

  def create
    @user = User.create!(params[:user])

    flash[:notice] = 'Welcome. You can now start blogging away!'
    redirect_to user_posts_path(@user.id)
  end

  def index
    @user = User.new
  end

  def login
    user = User.find_by_email(params[:user][:email])
    if user.nil?
      flash[:error] = 'Invalid email'
      redirect_to users_path
    else
      redirect_to user_posts_path(user.id)
    end
  end
end
