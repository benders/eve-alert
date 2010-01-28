class EventWorker < BackgrounDRb::MetaWorker
  set_worker_name :event_worker
  def create(args = nil)
    create_dummy_events ; add_periodic_timer(23.seconds) {create_dummy_events}
  end

  def create_dummy_events
    User.all.each do |user|
      rand(3).times do
        character = user.accounts.rand.characters.rand
        Event.create_dummy(:user_id => user.id, :eve_character_id => character.id)
      end
    end
  rescue Exception => e
    logger.error "Error #{e.class.to_s} - #{e.message}"
  end
end

