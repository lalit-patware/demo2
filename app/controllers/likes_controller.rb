class LikesController < ApplicationController

  def create	 
    if already_liked
      flash[:notice] = "not like more then once"
    else
	    @post =  Post.find(params[:post_id])
	    @post.likes.create(user_id: session[:user]["id"])
      #@post_id = @post.id
	    #redirect_to post_path(@post)
    end
  end

  def destroy
  	@post =  Post.find(params[:post_id])
	  @like = @post.likes.find(params[:id])
    @post_id = @post.id
    @like.destroy
	  # if !(already_liked)
	  #   flash[:notice] = "Cannot unlike"
    # else        
    # end
    #redirect_to post_path(@post)
  end
	
	def already_liked
    Like.where(user_id: session[:user]["id"], post_id: params[:post_id]).exists?
  end     
end
