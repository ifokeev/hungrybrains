class VacanciesController < ApplicationController

	def index
		@vacancies = Vacancy.paginate(page: params[:page])
	end

	def show
		@vacancy = Vacancy.find(params[:id])
		@profile = Profile.find_by_id(@vacancy.profile_id)
	end

end
