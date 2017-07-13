class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    #byebug
    @posts = Post.all
    @users = User.all


    @users = User.all.where.not(id: current_user)
    @conversations = Conversation.includes(:recipient, :messages)
                                 .find(session[:conversations])
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
        @post = Post.find(params[:id])
         @comment = Comment.new

         @users= User.all

          session[:conversations] ||= []

    @users = User.all.where.not(id: current_user)
    @conversations = Conversation.includes(:recipient, :messages)
                                 .find(session[:conversations])
  end
  def tag
   # byebug

    Tagging.create(user_id: params[:userId],post_id: params[:postID])
   redirect_to 'posts/#{:postId}'
  end

  # GET /posts/new
  def new
    #byebug
    @post = Post.new
    @current_user= current_user


          session[:conversations] ||= []

    @users = User.all.where.not(id: current_user)
    @conversations = Conversation.includes(:recipient, :messages)
                                 .find(session[:conversations])
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
        @current_user= current_user
        @users= User.all

        @users = User.all.where.not(id: current_user)
    @conversations = Conversation.includes(:recipient, :messages)
                                 .find(session[:conversations])
  end

  # POST /posts
  # POST /posts.json
  def create 
   
    #byebug
    @post = Post.new(post_params)
    @post.user_id=current_user.id
    
    #respond_to do |format|
       
      params[:xyz].each do |userid|
     @pst_id=Post.last.id
     Tagging.create(user_id: userid,post_id: @pst_id)
     @post.save
     end
     
        #UserMailer.welcome_email(current_user).deliver_now

    redirect_to new_post_path
       # format.html { redirect_to @post, notice: 'Post was successfully created.' }
        #format.json { render :show, status: :created, location: @post }
      #else
        #format.html { render :new }
        #format.json { render json: @post.errors, status: :unprocessable_entity }
      #end
    #end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
   
   @post = Post.find(params[:id])
 
  if @post.update(post_params)
    redirect_to @post
  else
    render 'edit'
  end
end

  #   respond_to do |format|
  #     if @post.update(post_params)
  #       format.html { redirect_to @post, notice: 'Post was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @post }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @post.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /posts/1
  # DELETE /posts/1.json
  

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

 
  def upvote
    #byebug
      @post = Post.find(params[:id])
      @post.liked_by current_user
      @post.get_upvotes.size  
     #@post.votes_for.up.by_type current_user
      redirect_to posts_path
  end

  def downvote
  #byebug
      @post = Post.find(params[:id])
      @post.downvote_from current_user
      @post.get_downvotes.size 
     #@post.votes_for.down.by_type current_user
      redirect_to posts_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :descrption, :image, :feeling, :user_id)
    end
end
