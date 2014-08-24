class ResponsesController < ApplicationController
  before_action :require_login

  def create
    @vacancy = Vacancy.find(params[:response][:vacancy_id])
    current_user.student.respond(@vacancy)
    redirect_to @vacancy
  end

  def destroy
    @vacancy = Response.find(params[:id]).vacancy
    current_user.student.revoke(@vacancy)
    redirect_to @vacancy    
  end
end
