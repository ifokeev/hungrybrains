#encoding: utf-8
class StaticPagesController < ApplicationController
  include Banners

  before_action :load_grouped_banners, only: [:index]

  def index
    if logged_in?
      redirect_to profile_path
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
