class MyQueue
  attr_accessor :attendees

  def initialize
    @attendees = Array.new
  end

  def run
    puts "hello world"
  end

  def add_query(query)
    queue << query
  end

  def clear
    @attendees = []
  end

  def count
    @attendees.count
  end

  def save_to(filename)
    file = File.open(filename, "w+") do |file|
      attendees.map do |r|
      file << [r.first_name, r.last_name, r.email_address, r.zipcode, r.street, r.city, r.state, r.home_phone].join(", ") + "\n"
    end
      #csv << (@attendees)
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
