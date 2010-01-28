# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def user_time(time)
    time.in_time_zone(current_user.time_zone)
  end
  
  def pretty_time(time)
    time.strftime("%b %d, %Y %H:%M %Z")
  end

  def character_image_tag(character_id)
    image_tag("http://img.eve.is/serv.asp?s=64&amp;c=#{character_id}",
      :width => 64, :height => 64,
      :class => "character_portrait")
  end
end
