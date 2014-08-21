class VacanciesController < ApplicationController

	def index
		@vacancies = Vacancy.paginate(page: params[:page], per_page: 10)
	end

	def show
		@vacancy = Vacancy.find(params[:id])
	end

end
