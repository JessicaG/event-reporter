require_relative './test_helper'
require_relative '../lib/queue'

class AttendeeQueueTest < Minitest::Test
  def test_it_is_initialized_with_empty_queue
    reporter = AttendeeQueue.new
    assert reporter.queue.empty?
  end

  def test_it_adds_query_to_queue
    reporter = AttendeeQueue.new
    reporter.add_query('ghdghfgdhgfdh')
    assert_equal 1, reporter.queue.count
  end

  def test_clears_queue
    reporter = AttendeeQueue.new
    reporter.add_query('apples')
    reporter.add_query('oranges')
    reporter.add_query('bannas')
    reporter.clear
    assert_equal 0, reporter.queue.count
  end

  def test_print_by
    reporter = AttendeeQueue.new
    reporter.add_queury('Johnson')
    assert_equal reporter.queue.print_by
  end
end
