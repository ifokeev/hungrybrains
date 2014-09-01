#encoding: utf-8
class VacanciesController < ApplicationController
  before_action :require_login, except: [:index, :show]
  before_action :set_vacancy, only: [:show]
  before_action :correct_user, except: [:index, :new, :show]
  before_action :set_resopnses, only: [:responses, :unreviewed, 
                                       :accepted, :rejected]

	def index
		@vacancies = Vacancy.search(params[:search]).paginate(page: params[:page], per_page: 10).latest
    respond_to do |format|
      format.html
      format.js
    end
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

  def unreviewed
    @students  = @unreviewed.collect(&:student)
  end

  def accepted
    @students  = @accepted.collect(&:student)
  end

  def rejected
    @students  = @rejected.collect(&:student)
  end

  private

    def set_vacancy
      @vacancy = Vacancy.find(params[:id])
    end

    def set_resopnses
      @responses  = @vacancy.responses
      @unreviewed = @vacancy.responses.where(status: 0)
      @accepted   = @vacancy.responses.where(status: 1)
      @rejected   = @vacancy.responses.where(status: 2)
    end

    def vacancy_params
      params.require(:vacancy).permit(:title, :description, :brief_description,
                                      :duration, :location, :worktype, 
                                      :salaryfrom, :salaryto, :paid, :status,
                                      :deadline, :min_grade, :instruction)
    end

    def correct_user
      if current_user.has_role? :company
        correct_user_company
      else
        correct_user_student
      end
    end

    def correct_user_company
      @vacancy = current_user.company.vacancies.find_by_id(params[:id])
      redirect_to root_url if @vacancy.nil?      
    end


    def correct_user_student
      redirect_to root_url
    end

end
