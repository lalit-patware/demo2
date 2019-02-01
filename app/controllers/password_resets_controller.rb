class PasswordResetsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_email(params[:password_resets][:email])
    if @user.present? 
      @user.create_reset_digest
      @user.send_password_reset_email
      redirect_to new_password_reset_path, notice: "email sent with password reset link"
    else
      render 'new', alert: "email not found!"
    end    
  end

  def edit      
	  @user = User.find_by_reset_digest(params[:id])
    redirect_to login_path, alert: "Invalid Token" if @user.blank?
  end

  def update
    @user = User.find_by_reset_digest(params[:id])
    if @user.reset_set_at < 1.hours.ago
      redirect_to new_password_reset_path, :alert => "Password reset has expired."
    elsif @user.update_attributes(params[:password_resets].as_json)
      redirect_to login_path, notice: "password update successfully"
    else
      render 'edit'
    end
  end
end
