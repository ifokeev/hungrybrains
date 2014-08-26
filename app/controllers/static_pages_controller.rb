class StaticPagesController < ApplicationController

  def index
    if logged_in? and current_user.has_role? :student
      redirect_to student_path(id: current_user.student.id)
    elsif logged_in? and current_user.has_role? :company
      redirect_to company_path(id: current_user.company.id)
    else 
       @vacancies = Vacancy.limit(5).latest
    end
  end

  def about    
  end

  def contact    
  end

  def feedback
  end

end
