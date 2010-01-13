class Character < ActiveRecord::Base
  include EveRecord
  belongs_to :account
end
