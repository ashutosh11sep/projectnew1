class CommentsController < ApplicationController

def create
     #byebug
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id =current_user.id
    @comment.save    
    redirect_to new_post_comment
end

private
    def comment_params
      params.require(:comment).permit(:title, :comment)
    end
end
