class AlertWorker < BackgrounDRb::MetaWorker
  set_worker_name :alert_worker

  def create(args = nil)
    update_notifications ; add_periodic_timer(31.minutes) { update_notifications }
    update_mail_messages ; add_periodic_timer(31.minutes) { update_mail_messages }
  end
  
  def update_notifications
    logger.info "Started Notification job"
    Character.find(:all, :conditions => "account_id IS NOT NULL").each do |character|
      character.if_stale(character.account.id, character.account.api.personal_notification_url, {:characterid => character.id}, 30.minutes) do
        character.account.api.personal_notifications(:characterid => character.id).each do |x|
          x.send_alert! unless x.read
          character.notifications.create(x.instance_values) unless character.notifications.exists?(x.id)
        end
      end
    end
  end
  
  def update_mail_messages
    logger.info "Started MailMessage job"
    Character.find(:all, :conditions => "account_id IS NOT NULL").each do |character|
      character.if_stale(character.account.id, character.account.api.personal_mail_messages_url, {:characterid => character.id}, 30.minutes) do
        character.account.api.personal_mail_messages(:characterid => character.id).each do |x|
          x.send_alert! unless x.read
          character.mail_messages.create(x.instance_values) unless character.mail_messages.exists?(x.id)
        end
      end
    end
  end
end