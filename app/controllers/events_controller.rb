#encoding: utf-8
class EventsController < ApplicationController
  before_action :set_event, :only => [:show]
  before_action :load_tag_cloud, :only => [:index, :tag, :date]

  def index
    #@date = params[:date] || Time.now.strftime('%Y%m%d')
    @date = params[:date]

    if @date.present?
      @events = Event.by_date(@date).sort_by_sort_index.latest
    else
      @events = Event.published.sort_by_sort_index.latest.limit(10)
    end
  end


  def date
    if params[:date]
      @events = Event.by_date(params[:date])
    else
      redirect_to :action => :index
    end
  end

  def tag
    @events = Event.published.tagged_with(params[:id]).sort_by_sort_index.latest
  end

  def show

  end

  private
    def load_tag_cloud
      @tags = Event.tag_counts_on(:tags)
    end

    def set_event
      @event = Event.friendly.find(params[:id])
    end
end
