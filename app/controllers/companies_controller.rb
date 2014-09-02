#encoding: utf-8
class CompaniesController < ApplicationController
  before_action :require_login, only: [:edit, :update, :responses]
  before_action :set_company, except: [:index, :new, :create]
  before_action :correct_user, except: [:index, :show]
  
  def index    
    @companies = Company.search(params[:search]).paginate(page: params[:page], per_page: 10).order('vacancies_count DESC')
  end

  def show    
  end

  def edit    
  end

  def update
    if @company.update(company_params)
      redirect_to @company, notice: "Success!"
    else 
      render :edit
    end    
  end

  def responses
    @vacancies = @company.vacancies
  end

  private

    def set_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:name, :avatar, :description, :site,
                                      :location, :employees, :agency, :phone)
    end

    def correct_user      
      redirect_to root_url unless @company == current_user.company
    end

end