class Account < ActiveRecord::Base
  include EveRecord

  belongs_to :user
  has_many :characters, :dependent => :destroy

  validate :must_have_full_api_key
  after_save :get_characters

  def api
    @api ||= Reve::API.new(self.id, self.full_api_key)
  end

  def refresh
    self.characters.each do |c|
      c.refresh
    end
  end

  def must_have_full_api_key
    character = api.characters.first
    api.personal_wallet_balance( :characterid => character.id )
  rescue Reve::Exceptions::ReveError => e
    errors.add_to_base("Eve API: " + e.to_s)
  end

  def get_characters
    if_stale(self.id, self.api.characters_url, {}, 1.hour) do
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
    end
    self.characters
  end
end
