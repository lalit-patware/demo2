class ProfilesController < ApplicationController
  
  before_action :set_profile
  before_action :check_for_update, only: [:edit]

  def index
    @profiles = Profile.all
  end

	def new
		@profile =Profile.new
	end

	def create
		user = session[:user]
		@profile = Profile.new(profile_params)
		@profile.user_id = session[:user]["id"]
		if @profile.save
			redirect_to @profile
		else
			render 'new'
		end
	end

  def edit
  end

	def show
	end

	def update
    if @profile.update(profile_params)
       #redirect_to @profile
    else
      render 'edit'
    end
	end

  def destroy
    if @profile.destroy
      redirect_to my_Post_path
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:age, :contact_no, :dob, :image, :city, 
      educations_attributes: [:id, :SSC, :HSC, :graduation, :post_graduation, :_destroy],
      employments_attributes: [:id, :company_1, :position, :address, :_destroy],
      skills_attributes: [:id, :skills, :_destroy])
  end

  def set_profile
    @profile = Profile.find(params["id"])
  end

  def check_for_update
    unless session[:user]["id"] == @profile.user_id 
      redirect_to posts_path, alert: "Unaunthorized access!"
    end
  end
end
