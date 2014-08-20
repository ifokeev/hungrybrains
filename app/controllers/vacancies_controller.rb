class VacanciesController < ApplicationController

	def index
		@vacancies = Vacancy.paginate(page: params[:page])
	end

	def show
		@vacancy = Vacancy.find(params[:id])
	end

end
