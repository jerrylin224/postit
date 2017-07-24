class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :show, :update]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def show
    @comment = Comment.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = "Post has been created"
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Post has been updated"
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :description, :url)
    end

    def set_post
      @post = Post.find(params[:id])
    end
end
