class PostsController < ApplicationController

  before_action :set_post, only: [:edit, :show, :destroy, :update]
  before_action :check_valid_user
  before_action :check_for_update, only: :edit    
    
  def index
    # @posts = Post.all.page params[:page]
    if params[:term]
      @posts = Post.where(['title LIKE ?  OR description LIKE ?',
                      "%#{params[:term]}%","%#{params[:term]}%"])

    else
      @posts = Post.all
    end
  end
    
  def edit  
  end

  def show
    @comment = Comment.new
  end
    
  def new
    @post = Post.new
  end

  def create
    user = session[:user]
    @user = User.find user["id"]
    @post = @user.posts.create(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def my_post
    user = session[:user]
    @user = User.find user["id"]
    @post = @user.posts  
  end

  def update
    if @post.update(post_params)
      # redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
      @post_destroy = @post.id
      @post.destroy
  end  

  private
    
  def post_params
    params.require(:post).permit(:term, :title, :description, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def check_valid_user
    if !session[:user].present?
      redirect_to login_path, alert: "Please Login First!"        
    end
  end

  def check_for_update 
    unless session[:user]["id"] == @post.user_id 
      redirect_to posts_path, alert: "Unaunthorized access!"
    end 
  end 
end




