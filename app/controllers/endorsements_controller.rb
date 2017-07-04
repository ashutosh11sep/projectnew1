class EndorsementsController < ApplicationController
def create

    @post = Post.find(params[:post_id])
    @endorsement = @post.endorsements.create(endorsement_params)
    @endorsement.user_id =current_user.id
    @endorsement.save
    redirect_to post_path(@post)
  end
 
  private
    def endorsement_params
      params.require(:endorsement).permit(:user_id, :text, :post_id)
    end
end
