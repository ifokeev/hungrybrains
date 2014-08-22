class CompaniesController < ApplicationController
  before_action :require_login, only: [:edit, :update]
  before_action :set_company, only: [:show, :edit, :update]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index    
    @companies = Company.order('vacancies_count DESC').paginate(page: params[:page], per_page: 10)
  end

  def show    
    @vacancies = @company.vacancies
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

  private

    def set_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:name, :description, :site)
    end

    def correct_user      
      redirect_to root_url unless @company == current_user.company
    end

end