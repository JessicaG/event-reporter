require_relative './test_helper'
require_relative '../lib/queue'

class QueueTest < Minitest::Test
  def test_it_is_initialized_with_empty_queue
    reporter = Queue.new
    assert reporter.queue.empty?
  end

  def test_it_adds_query_to_queue
    reporter = Queue.new
    reporter.add_query('ghdghfgdhgfdh')
    assert_equal 1, reporter.queue.count
  end

  def test_clears_queue
    reporter = Queue.new
    reporter.add_query('apples')
    reporter.add_query('oranges')
    reporter.add_query('bannas')
    reporter.clear
    assert reporter.queue.empty?
  end

  def test_print

  end

  def print_by
  end

  def save_to
  end
end
