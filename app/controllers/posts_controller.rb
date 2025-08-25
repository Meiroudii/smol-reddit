class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.includes(:user).order(created_at: :desc)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.first
    @post = @user.posts.build(post_params)

    if @post.save
      redirect_to @post, notice: "Your post has been published!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post was updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to post_path, notice: "Post has been removed."
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :comment)
  end

end
