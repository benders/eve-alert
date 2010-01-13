class Character < ActiveRecord::Base
  include EveRecord
  belongs_to :user
end
