# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def user_time(time)
    time.in_time_zone(current_user.time_zone)
  end
  
  def pretty_time(time)
    time.strftime("%b %d, %Y %H:%M %Z")
  end
end
