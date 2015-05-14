require "sqlite3"
require 'sequel'

module Database
  class Connection

    @@connection = nil

    def self.connection(environment = "development")
      connect(environment) unless @@connection
      @@connection
    end 

    private

    def self.connect(environment)
      db_path = File.expand_path("#{File.dirname(__FILE__)}/../../sinatratest.db")
      if environment == "development"
        @@connection = Sequel.connect("sqlite://#{db_path}")
      else
        @@connection = Sequel.connect("sqlite://#{db_path}")
      end
    end

  end
end