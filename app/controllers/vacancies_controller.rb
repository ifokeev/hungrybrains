class VacanciesController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy, :responses]
  before_action :set_vacancy, only: [:show, :update, :edit, :destroy, :responses]
  before_action :correct_user, only: [:edit, :update, :destroy, :responses]

	def index
		@vacancies = Vacancy.paginate(page: params[:page], per_page: 10)
	end

	def show
	end

  def new
    @vacancy = Vacancy.new
  end

  def create    
    @vacancy = current_user.company.vacancies.build(vacancy_params)
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

  def responses
    @students = @vacancy.students
  end

  private

    def set_vacancy
      @vacancy = Vacancy.find(params[:id])
    end

    def vacancy_params
      params.require(:vacancy).permit(:title, :description, :brief_description)
    end

    def correct_user
      @vacancy = current_user.company.vacancies.find(params[:id])
      redirect_to root_url if @vacancy.nil?
    end

end
