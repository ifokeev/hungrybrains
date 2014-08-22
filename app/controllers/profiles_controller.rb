class ProfilesController < ApplicationController
  before_action :require_login, only: [:edit, :update]
  before_action :set_profile, only: [:show, :edit, :update]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index    
    @profiles = Profile.order('vacancies_count DESC').paginate(page: params[:page], per_page: 10)
    @vacancies = Vacancy.all
  end

  def show    
    @vacancies = @profile.vacancies
  end

  def edit    
  end

  def update
    if @profile.update(profile_params)
      redirect_to @profile, notice: "Success!"
    else 
      render :edit
    end    
  end

  private

    def set_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:name, :description, :site)
    end

    def correct_user      
      redirect_to root_url unless @profile == current_user.profile
    end

end