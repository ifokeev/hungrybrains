#encoding: utf-8
class NewsController < ApplicationController
  before_action :set_news, :only => [:show]
  def index
    @date_groups = News.where(:published => true).order('id DESC').group_by { |m| m.created_at.beginning_of_month }

    @date = params[:date] || (@date_groups.first[0].to_date.strftime('%Y%m01') if @date_groups.present?)
    @news = News.by_month_and_year(@date)

  end


  def show

  end

  private
    def set_news
      @news = News.find(params[:id])
    end
end
