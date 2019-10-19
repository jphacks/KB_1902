class PostsController < ApplicationController
  def index
    @post = Post.new
  end

  def show
  end

  def create

    @post = Post.new(post_params)
    @post.genre_id = 1
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
