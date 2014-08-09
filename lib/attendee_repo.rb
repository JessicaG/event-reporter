require 'csv'

class AttendeeRepo
  attr_reader :csv

  def initialize(filepath='data/event_attendees.csv')
    @test="hello world"
    @csv = CSV.open(filepath, headers: true, header_converters: :symbol)
  end

end
