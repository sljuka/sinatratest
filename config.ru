libdir = File.dirname(__FILE__) + "/lib"
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require File.expand_path('../my_app.rb', __FILE__)

run MyApp.new    