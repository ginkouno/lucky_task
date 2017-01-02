require 'slack-ruby-bot'
require 'yaml'

class FortuneTeller < SlackRubyBot::Bot
  command 'please' do |client, data, match|
    yaml = YAML.load_file('lucky_comments.yml')
    client.say(text: yaml['comments'].sample, channel: data.channel)
  end
end

FortuneTeller.run
