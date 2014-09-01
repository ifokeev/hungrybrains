#encoding: utf-8
class StudentsController < ApplicationController
  before_action :require_login, only: [:edit, :update, :responses]
  before_action :set_student, except: [:new, :create]
  before_action :correct_user, except: [:new, :show, :create]
  before_action :set_user, only: [:responses]
  
  def show
    if current_user.has_role? :student
      correct_user
      @feed_items = current_user.student.feed.paginate(page: params[:page])
    end
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
    @responses = @student.responses
  end

  def companies
    @companies = @student.companies
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end

    def set_user
      @user = @student.user
    end    

    def student_params
      params.require(:student).permit(:name, :surname, :avatar, :location, 
                                      :university, :grade, :graduation, 
                                      :experience, :work, :language, 
                                      :description, :brief_description)
    end

    def correct_user      
      redirect_to root_url unless @student == current_user.student
    end

end