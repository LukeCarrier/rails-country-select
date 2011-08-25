require File.dirname(__FILE__) + '/test_helper'
require File.dirname(__FILE__) + '/../lib/country_select'

class CountryTest < Test::Unit::TestCase
  def test_country_definitition_lists_are_of_equal_length
    assert_equal COUNTRY_NAMES.length, COUNTRY_ALPHA2.length
    assert_equal COUNTRY_NAMES.length, COUNTRY_ALPHA3.length
    assert_equal COUNTRY_NAMES.length, COUNTRY_NUM.length
  end
end