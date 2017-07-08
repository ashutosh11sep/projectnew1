class FollowsController < ApplicationController

def create
	 #byebug
   @follow= Follow.where(follower_id: current_user.id, following_id: params[:user_id])
	
	 if @follow.first.present?
      @follow.first.destroy
    
    else

Follow.create(follower_id: current_user.id, following_id: params[:user_id])

 end

   redirect_to user_path(current_user)
   end

   def following
   	@following =current_user.following
   end
   
   def follower
   	@follower =current_user.followers
   end

end
