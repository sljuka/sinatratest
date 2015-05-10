require 'rubygems'
require 'sinatra/base'

class MyApp < Sinatra::Base

  get '/' do
    'Sup world!'
  end

end