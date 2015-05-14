# libdir = File.dirname(__FILE__) + "/lib"
# $LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require 'rubygems'
require 'sinatra'

set :environment, ENV['RACK_ENV'].to_sym || "development"
disable :run, :reload

require File.expand_path('../my_app.rb', __FILE__)

run MyApp.new
