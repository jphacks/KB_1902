class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def create
    @post = Post.new(post_params)
    @post.genre_id = params[:post][:genre_id]
    @post.choice = params[:post][:choice]
    if @post.save!
      redirect_to post_path(@post.id)
    else
      render "index"
    end
  end

  def destroy
  end

  def update
  end

  def edit
  end

  def new
  end

  private
  def post_params
    params.require(:post).permit(:title, :body ,:choice)
  end
end
