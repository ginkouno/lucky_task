require 'slack-ruby-bot'

class FortuneTeller < SlackRubyBot::Bot
  command 'please' do |client, data, match|
    client.say(text: 'pong', channel: data.channel)
  end
end

FortuneTeller.run
