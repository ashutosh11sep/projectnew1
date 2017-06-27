class VotesController < ApplicationController

 def create
    @post = Post.find(params[:post_id])
    @vote = @post.votes.new(vote_params)
    @vote.user_id =current_user.id
    @vote.save    
    redirect_to post_path(@post)
end

private
    def vote_params
      params.require(:vote).permit(:voter_id)
    end
end
