require 'sinatra/base'
# require 'database/connection'

class MyApp < Sinatra::Base

  set :public_folder, File.dirname(__FILE__) + '/public'
#  connection = Database::Connection.connection(settings.environment)

  get '/' do
    erb :index
  end

end