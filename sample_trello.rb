require 'trello'
require 'yaml'

class SampleTrello
  def initialize
    Trello.configure do |config|
      config.consumer_key    = ENV['TRELLO_KEY']
      config.consumer_secret = ENV['TRELLO_SECRET']
      config.oauth_token     = ENV['TRELLO_OAUTH_TOKEN']
    end
  end

  def settings
    @settings ||= YAML.load_file('trello.yml')
  end

  def sample
    me = Trello::Member.find("me")
    board = me.boards.find{ |b| b.name == settings['board_name'] }
    lists = board.lists.select{ |list| settings['list_names'].include?(list.name) && list.cards.count > 1 }
    list = lists.sample
    { list_name: list.name, card_name: list.cards.first.name }
  end
end
