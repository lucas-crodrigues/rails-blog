class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.includes(:comments, :author).find_by(author_id: params[:user_id], id: params[:id])
    @user = current_user
  end

  def new
    @post = Post.new
    @user = current_user
  end

  def create
    parameters = post_params
    post = Post.new(author_id: current_user.id, title: parameters[:title], text: parameters[:text])
    post.save
    if post.save
      redirect_to user_path(current_user)
    else
      redirect_to new_user_post_path
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
