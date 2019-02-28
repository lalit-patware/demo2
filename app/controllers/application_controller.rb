class ApplicationController < ActionController::Base	

	helper_method :all_users
  # helper_method :all_posts
  
  def current_user
    @current_user = User.find(session[:user]['id'])
  end

  def all_users
    User.all  
  end
  
end
