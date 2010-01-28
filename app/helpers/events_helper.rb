module EventsHelper
  def new_event(event)
    max_event_id = session[:max_event_id] || 0
    request.xhr? && event.id > max_event_id
  end
end
