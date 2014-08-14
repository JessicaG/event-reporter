require_relative './test_helper'
require_relative '../lib/event_queue'
require_relative '../lib/attendee'
require_relative '../lib/normalize'

class EventQueueTest < Minitest::Test
  def test_it_is_initialized_with_empty_queue
    reporter = EventQueue.new
    assert_equal 0, reporter.attendees.count
  end

  def test_it_counts_the_query
    reporter = EventQueue.new
    reporter.attendees << "apples"
    assert_equal 1, reporter.count
  end

  def test_clears_queue
    reporter = EventQueue.new
    reporter.attendees << "apples"
    reporter.clear
    assert_equal 0, reporter.count
  end

  def test_it_saves_to_a_file
    reporter = EventQueue.new
    filename = "created_file.csv"
    refute File.exists?(filename)
    reporter.save_to(filename)
    assert File.exists?("data/" + filename)
    File.delete("data/" + filename)
  end
end
