class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :seeded]
  def index
    @posts = Post.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 8)
  end


  def show
  end


  def new

    @post = current_user.posts.build
  end

  def edit
  end


  def create
    @post = current_user.posts.build(post_params)

      if @post.save
        redirect_to @post, notice: 'Post was successfully created.' 
      else
        render action: 'new' 
      end
    
  end


  def update
      if @post.update(post_params)
        redirect_to @post, notice: 'Post was successfully updated.' 
      else
        render action: 'edit'
      end
    
  end

 
  def destroy
    @post.destroy
    respond_to do |format|
      format.html {redirect_to posts_url }
    end
  end

  def seeded
    if params[:seed].present? 
      @posts = Post.seeded_with(params[:seed]).paginate(:page => params[:page], :per_page => 8)
      @seed = Post.seed_prompt(params[:seed])
    else 
      @posts = Post.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 8)
    end  
  end


  def upvote
    @post = Post.find(params[:id])
    @post.liked_by (current_user)
    redirect_to @post.seed
  end

  def downvote
    @post = Post.find(params[:id])
    @post.downvote_from current_user
    redirect_to seeded_path(@post.id)
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to posts_path, notice: "Not authorized to edit this post" if @post.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:description, :image, :writing, :seed, :seed_id)
    end

  

end
