class Account < ActiveRecord::Base
  include EveRecord

  has_many :characters, :dependent => :destroy

  def api
    @api ||= Reve::API.new(self.id, self.full_api_key)
  end

  def get_characters
    self.characters.clear
    api.characters.each do |x|
      self.characters.create(x.instance_values)
    end
    self.characters
  end
end
