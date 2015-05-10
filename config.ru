require File.expand_path('../my_app.rb', __FILE__)
use Rack::ShowExceptions
run MyApp.new    