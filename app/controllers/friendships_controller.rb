class FriendshipsController < ApplicationController
  def create
  	#byebug
     @friendship = current_user.friendships.build(friend_id: params[:friend_id])
      if @friendship.save
        flash[:notice] = "Friend requested."
        redirect_to root_url
      else
        flash[:error] = "Unable to request friendship."
        redirect_to :back
      end
  end

   def update

     #byebug
    
  	@friendship = Friendship.find_by(user_id: params[:id])
    @friendship.update(accepted: "true")
      if @friendship.save
        redirect_to root_url, notice: "Successfully confirmed friend!"
      else
        redirect_to root_url, notice: "Sorry! Could not confirm friend!"
      end
  end

  def destroy
     
    @friendship = Friendship.find_by(user_id: params[:id])
      @friendship.destroy
      flash[:notice] = "Removed friendship."
      redirect_to user_path
  end
end
