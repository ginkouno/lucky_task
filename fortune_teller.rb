require 'slack-ruby-bot'
require 'yaml'
require 'dotenv'
require 'trello'

Dotenv.load
Trello.configure do |config|
  config.consumer_key    = ENV['TRELLO_KEY']
  config.consumer_secret = ENV['TRELLO_SECRET']
  config.oauth_token     = ENV['TRELLO_OAUTH_TOKEN']
end
# me = Trello::Member.find("me")

class FortuneTeller < SlackRubyBot::Bot
  command 'please' do |client, data, match|
    yaml = YAML.load_file('lucky_comments.yml')
    client.say(text: yaml['comments'].sample, channel: data.channel)
  end
end

FortuneTeller.run
