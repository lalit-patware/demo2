class SessionsController < ApplicationController
  
  def new
  end
  
  def login   
    user = User.find_by_email(params[:session][:email])
    if user.password == params[:session][:password]
      session[:user] = user
      redirect_to posts_path, notice: "Logged in!"  
    else
      flash[:alert] = "Email or password is invalid"
      render "new"    
    end
  end

  def logout
    session[:user] = nil
    redirect_to login_path, notice: "Logout successfully!!"
  end 
end
