class Character < ActiveRecord::Base
  include EveRecord
  belongs_to :account
  has_many :notifications
  has_many :mail_messages

  def get_notifications
    self.account.api.personal_notifications(:characterid => self.id).each do |x|
      self.notifications.create(x.instance_values) unless self.notifications.exists?(x.id)
    end
    self.notifications
  end

  def get_mail_messages
    self.account.api.personal_mail_messages(:characterid => self.id).each do |x|
      self.mail_messages.create(x.instance_values) unless self.mail_messages.exists?(x.id)
    end
    self.mail_messages
  end
  
end
