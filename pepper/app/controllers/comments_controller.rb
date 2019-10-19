class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = current_user.comments.new(comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to root_path
  end


  def destroy
  end

  private
  def comment_params
    require.params(:comment).permit(:post_id, :comment)
  end
end
