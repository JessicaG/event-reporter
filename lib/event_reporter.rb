require 'csv'

class EventReporter
  def print
    CSV.foreach("../data/event_attendees.csv") do |row|
      puts row
    end
  end
end
