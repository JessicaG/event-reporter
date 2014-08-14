require_relative 'test_helper'
require_relative '../lib/normalize.rb'

class NormalizeTest < Minitest::Test
  attr_reader :normalized, :fail_message
  def setup
    @normalized = Normalize.new
    @fail_message = 'no info available'
  end

  def test_all_data_is_not_blank_or_nil
    assert_equal fail_message, normalized.regdate('')
    assert_equal fail_message, normalized.regdate(' ')
    assert_equal fail_message, normalized.first_name(nil)
    assert_equal fail_message, normalized.last_name(' ')
    assert_equal fail_message, normalized.email_address(' ')
    assert_equal fail_message, normalized.home_phone(' ')
    assert_equal fail_message, normalized.street(' ')
    assert_equal fail_message, normalized.city(' ')
    assert_equal fail_message, normalized.zipcode(' ')
  end

  def test_properly_formats_dat_and_time

  end
end
