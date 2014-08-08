Dir["./lib/*.rb"].each{ |file| require "#{file}"}

EventReporter.new.run
