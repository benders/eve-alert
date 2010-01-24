require 'twitter'

module UserHelper
  def following_alerts?
    @@httpauth ||= Twitter::HTTPAuth.new(TWITTER_LOGIN, TWITTER_PASSWORD)
    @@twitter_client ||= Twitter::Base.new(@@httpauth)
    @@alert_user_id ||= @@twitter_client.verify_credentials.id

    current_user.twitter.get('/friends/ids.json').include?(@@alert_user_id) rescue nil
  end
end
