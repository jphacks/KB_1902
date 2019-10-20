class FavosController < ApplicationController
    def create
        post = Post.find(params[:post_id])
        favo = current_user.favos.new(post_id: post.id)
        favo.save
        redirect_to posts_path
    end
    def destroy
        post = Post.find(params[:post_id])
        favo = current_user.favos.find_by(post_id: post.id)
        favo.destroy
        redirect_to posts_path
    end
    def index
        @user = User.find(current_user.id)
    end
end
