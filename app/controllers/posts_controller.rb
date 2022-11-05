class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])

      respond_to do |format|
      format.html
      format.xml { render xml: @user.all_posts }
      format.json { render json: @user.all_posts }
    end
  end

  def show
    @post = Post.includes(:comments, :author).find_by(author_id: params[:user_id], id: params[:id])
    @user = current_user

    respond_to do |format|
      format.html
      format.xml { render xml: @post }
      format.json { render json: @post.to_json(include: [:comments]) }
    end
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

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:notice] = "Post ##{params[:id]} has been deleted"
    redirect_to user_posts_path(current_user)
  end
end
