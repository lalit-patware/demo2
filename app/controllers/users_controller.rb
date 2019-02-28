class UsersController < ApplicationController
  
  def new
	  @user = User.new
	end

  def index
    if params[:term]
      @user = User.where(['name LIKE ?', "%#{params[:term]}%"])                      
    else
      @user = User.all
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user] = @user
      redirect_to posts_path, notice: "Account successfully created"
    else
      render 'new'
    end
  end 
         
  def show
    @user = User.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:term, :name, :email, :password, :password_confirmation)
    end
end
  

  