class WelcomeController < ApplicationController

  def index
    @vacancies = Vacancy.paginate(page: params[:page])
  end

end
