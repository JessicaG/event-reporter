class AttendeeQueue
  attr_accessor :attendees

  def initialize
    @attendees = Array.new
  end

  def add_query(query)
    attendees << query
  end

  def clear
    @attendees = []
  end

  def count
    attendees.count
  end

  def save_to(filename)
    puts 'saving....'
  end

  def format_output(attendees)
    attendees.each
  end

  def print_by_attribute(attribute)
    attendees.sort_by! do |attendee|
      attendee.send(attribute)
    end
  end

  def empty?
    count == 0
  end
end