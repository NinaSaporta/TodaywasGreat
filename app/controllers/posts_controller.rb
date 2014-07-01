class PostsController < ApplicationController
  before_action :sign_up_if_not_authenticated!, only: [:create]

  def new
    @post = Post.new
  end

  def create
    @posts = Post.all
    @post = Post.new(post_params.merge(user_id: current_user.id))

    if @post.save
      redirect_to root_path
    else
      render :index
    end
  end

  def index
 	  #@posts = Post.all

    @posts = Post.all 
    @posts = @posts.paginate(:page => params[:page])

    @post = Post.new
  end

   def show

     @post = Post.find(params[:id])

   end
  
  def edit
    @post = Post.find(params[:id])
   
  end

  def update
    @post = Post.find(params[:id])
    @post.update (post_params)
    if @post.save
      redirect_to root_path
    else
      render :index
    end
  end

  def destroy
     Post.destroy(params[:id])
     redirect_to :back
  end

  private
   def post_params
     params.require(:post).permit(:content)
   end
end

