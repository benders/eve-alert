require 'net/http'
require 'uri'

class Event < ActiveRecord::Base
  belongs_to :user

  def self.create_dummy(options)
    fortune_url = 'http://www.fullerdata.com/FortuneCookie/FortuneCookie.asmx/GetFortuneCookie'
    fortune = Net::HTTP.get(URI.parse(fortune_url))
    fortune = fortune.match(Regexp.new('<string.*>(.*)<\/string>', Regexp::MULTILINE))[1].strip    
    self.create(options.merge({:contents => fortune}))
  end
end
