require 'slack-ruby-bot'

class FortuneTeller < SlackRubyBot::Bot
  command 'ping' do |client, data, match|
    client.say(text: 'pong', channel: data.channel)
  end
end

FortuneTeller.run
