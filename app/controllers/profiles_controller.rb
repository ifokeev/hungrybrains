class ProfilesController < ApplicationController

  def index    
  end

  def show    
    @profile   = Profile.find(params[:id])
    @vacancies = @profile.vacancies
  end

end