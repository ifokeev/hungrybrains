class WelcomeController < ApplicationController

  def index
    @vacancies = Vacancy.limit(5).order('id DESC')
  end

end
