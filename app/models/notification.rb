class Notification < ActiveRecord::Base
  include EveRecord

  belongs_to :character
end
