#encoding: utf-8
class Profile::StudentController < ApplicationController
  before_action :require_login
  before_action :set_user

  def index
    @feed_items = @student.feed.paginate(page: params[:page])
  end

  def edit

  end

  def responses
    @responses = @student.responses
  end

  def subs
    @companies = @student.companies
  end

  private
    def set_user
      @student = current_user.student
    end
end