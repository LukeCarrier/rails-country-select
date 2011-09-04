# encoding: UTF-8

require File.dirname(__FILE__) + '/test_helper'
require File.dirname(__FILE__) + '/../lib/country_definitions'

class Array
  def only_duplicates
    duplicates = []
    self.each { |each| duplicates << each if self.count(each) > 1 }
    duplicates
  end
end

class CountryTest < Test::Unit::TestCase
  def test_country_definitition_lists_are_of_equal_length
    assert_equal COUNTRY_NAMES.length, COUNTRY_ALPHA2S.length
    assert_equal COUNTRY_NAMES.length, COUNTRY_ALPHA3S.length
    assert_equal COUNTRY_NAMES.length, COUNTRY_NUMS.length
  end

  def test_country_definition_lists_contain_no_duplicates
    assert_equal 0, COUNTRY_NAMES.only_duplicates.length
    assert_equal 0, COUNTRY_ALPHA2S.only_duplicates.length
    assert_equal 0, COUNTRY_ALPHA3S.only_duplicates.length
    assert_equal 0, COUNTRY_NUMS.only_duplicates.length
  end
end