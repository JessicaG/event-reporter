class Queue
  attr_reader :queue

  def initialize
    @queue = Array.new
  end

  def run
    puts "hello world"
  end

  def add_query(query)
    queue << query
  end

  def clear
    @queue = []
  end
end
