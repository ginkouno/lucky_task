require 'sinatra/base'

module FortuneTeller
  class Web < Sinatra::Base
    get '/' do
      'Without haste, but without rest.'
    end
  end
end
