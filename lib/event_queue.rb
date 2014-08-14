class EventQueue
  attr_accessor :attendees

  def initialize
    @attendees = Array.new
  end

  def clear
    @attendees = []
  end

  def count
    attendees.count
  end

  def save_to(filename)
    file = File.open("data/#{filename}", "w+") do |file|
      attendees.map do |r|
        file << [r.first_name, r.last_name, r.email_address, r.zipcode, r.street, r.city, r.state, r.home_phone].join(", ") + "\n"
      end
    end
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
