class Character < ActiveRecord::Base
  include EveRecord
  belongs_to :account
  has_many :notifications
  has_many :mail_messages

  def refresh
    get_notifications
    get_mail_messages
  end

  def get_notifications
    if_stale(self.account.id, self.account.api.personal_notification_url, {:characterid => self.id}, 30.minutes) do
      self.account.api.personal_notifications(:characterid => self.id).each do |x|
        self.notifications.create(x.instance_values) unless self.notifications.exists?(x.id)
      end
    end
    self.notifications
  end

  def get_mail_messages
    if_stale(self.account.id, self.account.api.personal_mail_messages_url, {:characterid => self.id}, 30.minutes) do
      self.account.api.personal_mail_messages(:characterid => self.id).each do |x|
        self.mail_messages.create(x.instance_values) unless self.mail_messages.exists?(x.id)
      end
    end
    self.mail_messages
  end
  
end
