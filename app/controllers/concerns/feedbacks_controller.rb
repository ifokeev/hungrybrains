#encoding: utf-8
class FeedbacksController < ApplicationController

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.create(feedback_params)
    if @feedback.save
      redirect_to :back, notice: "Success!"
    else
      render :new
    end

  end

  private

    def feedback_params
      params.require(:feedback).permit(:title, :email, :body)    
    end
end