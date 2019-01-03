class LikesController < ApplicationController

  def create	 
    if already_liked
      flash[:notice] = "not like more then once"
    else
	    @post =  Post.find(params[:post_id])
	    @post.likes.create(user_id: session[:user]["id"])
	    redirect_to post_path(@post)
    end
  end

  def destroy
  	@post =  Post.find(params[:post_id])
	  @like = @post.likes.find(params[:id])
	  if !(already_liked)
	    flash[:notice] = "Cannot unlike"
    else
      @like.destroy
    end
      redirect_to post_path(@post)
  end
	
	def already_liked
    Like.where(user_id: session[:user]["id"], post_id: params[:post_id]).exists?
  end     
end
