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

  def test_it_properly_formats_a_date
    assert_equal '11/12/08', normalized.regdate('11/12/08 10:47')
  end

  def test_it_properly_formats_a_time
    assert_equal '10:47', normalized.regtime('11/12/08 10:47')
  end

  def test_it_properly_formats_a_first_name
    assert_equal 'aya', normalized.first_name('Aya')
  end

  def test_it_properly_formats_a_last_name
    assert_equal 'curry', normalized.last_name('Curry')
  end

  def test_it_properly_formats_a_phone_number
    assert_equal '(078)232-7000', normalized.home_phone('78.232.7000')
  end

  def test_it_properly_formats_a_street
    assert_equal 'jackson street', normalized.street('Jackson Street ')
  end

  def test_it_properly_formats_a_city
    assert_equal 'la jolla', normalized.city('La Jolla ')
  end

  def test_it_properly_formats_a_state
    assert_equal 'CA', normalized.state('Ca')
  end

  def test_it_properly_formats_a_zipcode
    assert_equal '02703', normalized.zipcode('2703')
  end

end
