require 'faraday'
require 'selenium-webdriver'
require 'pry'
require 'faker'

require 'dotenv'
Dotenv.load

require_relative '../../lib/slack/api'
require_relative '../../lib/slack/web'

require_relative '../../lib/boomtown/api'
require_relative '../../lib/boomtown/web'
require_relative '../../lib/boomtown/property_listing'



a = Boomtown::Api.new(
  ENV.fetch('BOOMTOWN_USERNAME'),
  ENV.fetch('BOOMTOWN_PASSWORD')
)

# r1 = a.get_property_details('3366356')
# r2 = a.get_property_details('3384352')

# puts
# b = Boomtown::Web.new
# b.search_for 'King Street'
# b.find('.results-paging').text # 187
