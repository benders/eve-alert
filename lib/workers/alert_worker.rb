require 'twitter'

class AlertWorker < BackgrounDRb::MetaWorker
  set_worker_name :alert_worker

  def create(args = nil)
    httpauth = Twitter::HTTPAuth.new(TWITTER_LOGIN, TWITTER_PASSWORD)
    @twitter_client = Twitter::Base.new(httpauth)
    
    update_characters ; add_periodic_timer(61.minutes) { update_characters }
    update_alerts ; add_periodic_timer(31.minutes) { update_alerts }
  end
  
  def update_characters
    logger.info "Started Characters Job"
    Account.all.each do |account|
      logger.debug "Getting Characters for Account #{account.id}"
      account.get_characters
    end
  end
  
  def update_alerts
    logger.info "Started Alerts job"
    Account.all.each do |account|
      account.characters.each do |character|
        on_new(character, 'notifications') do |n|
          logger.info "New notification ##{n.id} for #{n.character.name}"
          alert(n)
        end

        on_new(character, 'mail_messages') do |m|
          logger.info "New message ##{m.id} for #{m.character.name}"
          alert(m)
        end
      end
    end
  end

  private

  def on_new(object, type, &block)
    logger.debug "Looking for #{type} on #{object.class.to_s} #{object.id}"
    max_id = object.send(type).maximum(:id)
    messages = object.send("get_" + type)
    messages.select{|x| x.class.to_s == type.classify && x.id > max_id && !x.read}.each do |m|
      yield(m)
    end
  end
  
  def alert(subject)
    text = case subject
    when Notification
      alert_notification_text(subject)
    when MailMessage
      alert_mail_message_text(subject)
    end
    
    begin
      @twitter_client.direct_message_create(subject.character.account.user.twitter_id, text[0..139])
    rescue Twitter::General => e
      logger.info "Got error sending DM to @#{subject.character.account.user.login}: #{e.message}"
    end
  end
  
  def alert_notification_text(n)
    "Eve Notification for #{n.character.name} - #{NotificationType.get(n.notification_type_id)}"
  end
  
  def alert_mail_message_text(m)
    "Eve Message for #{m.character.name} - #{m.title}"
  end
end