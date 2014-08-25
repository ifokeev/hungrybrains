class RelationshipsController < ApplicationController
  before_action :require_login

  def create
    @company = Company.find(params[:relationship][:company_id])
    current_user.student.follow(@company)
    respond_to do |format|
      format.html { redirect_to @company }
      format.js
    end
  end

  def destroy
    @company = Relationship.find(params[:id]).company
    current_user.student.unfollow(@company)
    respond_to do |format|
      format.html { redirect_to @company }
      format.js
    end
  end
end
