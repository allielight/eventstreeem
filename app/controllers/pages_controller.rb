require 'twitter'

class PagesController < ApplicationController
  def home
  end

  def instagram
  	puts response
  end

  def login

	client = Twitter::REST::Client.new do |config|
	  config.consumer_key        = "mOwxZuieDnvIrM4PlBxmcQ"
	  config.consumer_secret     = "1qiT549MEnRGORxM1igIOR3v3ZMlcPiGcXkWVFeXQk"
	  config.access_token        = "1381493558-3RmN0lbvrFPavnKrAylDqdd5u6eIJYPqi6N5hF8"
	  config.access_token_secret = "0AicO7DBBzQLAQ0rrRxfVkdAenXw8pYcdKl66cfBty5Iv"
	end

	topics = ["LAHacks"]
	@tweets = []
	client.search(topics.join(","), result_type: "recent").take(25).collect do |object|
	  @tweets << object.text if object.is_a?(Twitter::Tweet)
	end

	@instagram = Instagram.tag_recent_media("LAHacks", "LAHacks2014", "LAHacks14")
	#@instagram = Instagram.location_search("34.0702","118.4468","5mi")

  end

  def eventstreeem
  end

end
