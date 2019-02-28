class CommentsController < ApplicationController
	
  before_action :set_post, only: [:edit, :destroy]
  before_action :get_post, only: [:create, :update]
  
  def create   
    binding.pry   
	  @comment =  @post.comments.new(comment_params)
	  @comment.user_id = session[:user]["id"]
    if @comment.save 
      #notice: "Comment"
      #redirect_to @post
    else
      render 'new'	   
	  end
  end

  def edit
  end

  def update
	  @comment = @post.comments.find(params[:id])
	  if @comment.update(comment_params)
      #redirect_to @post
    else
      render 'edit'
    end 
  end

  def destroy 	   
	  @comment.destroy
    @comment_id = @comment.id
	  	      
  end

  private

  def comment_params
	  params.require(:comment).permit(:username)
  end

  def set_post
	  @post =  Post.find(params[:post_id])
    @comment = Comment.find(params[:id]) 
	  unless session[:user]["id"] == @comment.user_id
      redirect_to @post, alert: "Unaunthorized access!"
    end
  end

  def get_post
	  @post = Post.find(params[:post_id])	
  end      
end