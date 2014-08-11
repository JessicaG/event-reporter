require 'csv'
require_relative './attendee'

class AttendeeRepo
  attr_reader :csv, :attendees

  def initialize(filepath='./data/event_attendees.csv')
    @csv = CSV.open(filepath, headers: true, header_converters: :symbol)
    @attendees = csv.map { |row| Attendee.new(row) }
  end

  def find_by_regdate(input)
    attendees.find_all do |attendee|
      attendee.regdate == input
    end
  end

  def find_by_first_name(input)
    attendees.find_all do |attendee|
      attendee.first_name == input
    end
  end

  def find_by_last_name(input)
    attendees.find_all do |attendee|
      attendee.last_name == input
    end
  end

  def find_by_email_address(input)
    attendees.find_all do |attendee|
      attendee.email_address == input
    end
  end

  def find_by_home_phone(input)
    attendees.find_all do |attendee|
      attendee.home_phone == input
    end
  end

  def find_by_street(input)
    attendees.find_all do |attendee|
      attendee.street == input
    end
  end

  def find_by_city(input)
    attendees.find_all do |attendee|
      attendee.city == input
    end
  end

  def find_by_state(input)
    attendees.find_all do |attendee|
      attendee.state == input
    end
  end

  def find_by_zipcode(input)
    attendees.find_all do |attendee|
      attendee.zipcode == input
    end
  end
end
