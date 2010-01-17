class Account < ActiveRecord::Base
  include EveRecord

  belongs_to :user
  has_many :characters, :dependent => :destroy
  
  after_save :get_characters

  def api
    @api ||= Reve::API.new(self.id, self.full_api_key)
  end

  def get_characters
    self.characters.clear
    begin
      api.characters.each do |x|
        self.characters.create(x.instance_values)
      end
    rescue Exception => e
      self.error = "Error: " + e.to_s
    else
      self.error = nil
    ensure
      self.send(:create_or_update_without_callbacks)
    end
    self.characters
  end
end
