class StudentsController < ApplicationController
  before_action :require_login, only: [:edit, :update, :responses]
  before_action :set_student, only: [:show, :edit, :update, :responses]
  before_action :correct_user, only: [:show, :edit, :update, :destroy, :responses]

  def show
  end

  def edit
  end

  def update
    if @student.update(student_params)
      redirect_to @student, notice: "Success!"
    else 
      render :edit
    end        
  end

  def responses
    @vacancies = @student.vacancies
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:name)
    end

    def correct_user      
      redirect_to root_url unless @student == current_user.student
    end

end