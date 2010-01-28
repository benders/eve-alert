class EventsController < SecureController
  def index
    @user = current_user

    if request.xhr?
      max_event_id = session[:max_event_id] || 0
      @events = @user.events.find(:all, :conditions => ["id > ?", max_event_id], :limit => 20, :order => 'id DESC')
      render @events
    else
      @events = @user.events.find(:all, :limit => 20, :order => 'id DESC')
      render
    end
    session[:max_event_id] = @events.first.id if @events.any?
  end
end
