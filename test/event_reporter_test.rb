require_relative './spec_helper'
require_relative '../lib/event_reporter'

class EventReporterTest < Minitest::Test
  def test_it_is_initialized_with_empty_queue
    reporter = EventReporter.new
    assert reporter.queue.empty?
  end

  def test_it_adds_query_to_queue
    reporter = EventReporter.new
    reporter.add_query('ghdghfgdhgfdh')
    assert_equal 1, reporter.queue.count
  end

  def test_clears_queue
    reporter = EventReporter.new
    reporter.add_query('apples')
    reporter.add_query('oranges')
    reporter.add_query('bannas')
    reporter.clear
    assert reporter.queue.empty?
  end
end
