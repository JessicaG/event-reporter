class Queue
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
    puts 'saving....'
  end
end
