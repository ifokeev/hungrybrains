#encoding: utf-8
class StaticPagesController < ApplicationController

  def index
    if logged_in?
      redirect_to profile_path()
    else 
       @vacancies = Vacancy.limit(6).latest
    end
  end

  def about    
  end

  def contact    
  end

  def feedback
  end

end
