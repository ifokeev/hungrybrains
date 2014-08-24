class ResponsesController < ApplicationController
  before_action :require_login

  def create
    @vacancy = Vacancy.find(params[:response][:vacancy_id])
    current_user.student.respond(@vacancy)
    respond_to do |format|
      format.html { redirect_to @vacancy }
      format.js
    end
  end

  def destroy
    @vacancy = Response.find(params[:id]).vacancy
    current_user.student.revoke(@vacancy)
    respond_to do |format|
      format.html { redirect_to @vacancy }
      format.js
    end
  end
end
