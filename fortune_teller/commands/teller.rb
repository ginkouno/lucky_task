require 'slack-ruby-bot'
require 'yaml'
require 'dotenv'
require 'sample_trello'

module FortuneTeller
  module Commands
    class Teller < SlackRubyBot::Commands::Base
      command 'please' do |client, data, match|
        yaml = YAML.load_file('lucky_comments.yml')
        trello = SampleTrello.new
        result = trello.sample
        client.say(text: "#{result[:list_name]} #{result[:card_name]}", channel: data.channel)
        client.say(text: yaml['comments'].sample, channel: data.channel)
      end
    end
  end
end
