class MailMessage < ActiveRecord::Base
  include EveRecord
  
  belongs_to :character
end
