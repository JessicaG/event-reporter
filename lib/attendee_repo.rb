require 'csv'

class AttendeeRepo
  attr_reader :csv

  def initialize(filepath='data/event_attendees.csv')
    @csv = CSV.open(filepath, headers: true, header_converters: :symbol)
  end
<<<<<<< HEAD

  def build_attendees
    csv.each { |row| attendees << Attendee.new(row) }
  end

=======
>>>>>>> 1c22edf004af2f6ea61406956c53f26db5011a2d
end
