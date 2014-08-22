class CompaniesController < ApplicationController
  before_action :require_login, only: [:edit, :update]
  before_action :set_student, only: [:show, :edit, :update]

  def show    
  end

  def edit    
  end

  def update
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:name)
    end

end