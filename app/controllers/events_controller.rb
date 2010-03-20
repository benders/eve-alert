class EventsController < ApplicationController
  def index
    if request.xhr?
      max_event_id = session[:max_event_id] || 0
      @events = Event.find(:all, :conditions => ["id > ?", max_event_id], :limit => 5, :order => 'id DESC')
      render @events.any? ? {:collection => @events, :partial => "event"} : {:nothing => true}
    else
      @events = Event.find(:all, :limit => 5, :order => 'id DESC')
      render
    end
    session[:max_event_id] = @events.first.id if @events.any?
  end
end
