class AlertWorker < BackgrounDRb::MetaWorker
  set_worker_name :alert_worker

  def create(args = nil)
    update_characters ; add_periodic_timer(61.minutes) { update_characters }
    update_alerts ; add_periodic_timer(31.minutes) { update_alerts }
  end
  
  def update_characters
    logger.info "Started Characters Job"
    Account.all.each do |account|
      logger.debug "Getting Characters for #{account.id}"
      account.get_characters
    end
  end
  
  def update_alerts
    logger.info "Started Alerts job"
    Account.all.each do |account|
      account.characters.each do |character|
        on_new(character, 'notifications') do |n|
          logger.info "New notification ##{n.id} for #{n.character.name}"
        end

        on_new(character, 'mail_messages') do |m|
          logger.info "New message ##{m.id} for #{m.character.name}"
        end
      end
    end
  end

  private

  def on_new(object, type, &block)
    logger.debug "Looking for #{type} on #{object.class.to_s}"
    max_id = object.send(type).maximum(:id)
    messages = object.send("get_" + type)
    messages.select{|x| x.id > max_id && !x.read}.each do |m|
      yield(m)
    end
  end
end