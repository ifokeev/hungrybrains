#encoding: utf-8
class Profile::CompanyController < ApplicationController
  before_action :require_login
  before_action :set_user

  def responses
    @vacancies = @company.vacancies
  end

  def edit

  end

  private
  def set_user
    @company = current_user.company
  end
end