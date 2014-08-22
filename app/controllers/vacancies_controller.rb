class VacanciesController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_vacancy, only: [:show, :update, :edit, :destroy]
  before_action :correct_user, only: [:new, :create, :edit, :update, :destroy]

	def index
		@vacancies = Vacancy.paginate(page: params[:page], per_page: 10)
	end

	def show
	end

  def new
    @vacancy = Vacancy.new
  end

  def create    
    @vacancy = current_user.profile.vacancies.build(vacancy_params)
    if @vacancy.save
      redirect_to @vacancy, notice: "Success!"
    else
      render :new
    end
  end

  def edit    
  end

  def update
    if @vacancy.update(vacancy_params)
      redirect_to @vacancy, notice: "Success!"
    else 
      render :edit
    end
  end

  private

    def set_vacancy
      @vacancy = Vacancy.find(params[:id])
    end

    def vacancy_params
      params.require(:vacancy).permit(:title, :description, :brief_description)
    end

    def correct_user
      @vacancy = current_user.profile.vacancies.find(params[:id])
      redirect_to root_url if @vacancy.nil?
    end

end
