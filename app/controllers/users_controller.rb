class UsersController < ApplicationController
def show
	
    @user = User.find(params[:id])
    
    @users= User.all
end

 def follow
	
     Follow.create(follower_id: current_user.id, following_id: params[:followingid] )  
    redirect_to user_profile_path
   end


end
