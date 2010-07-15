require 'open-uri'
require 'test/unit'
require 'test-helper'

class TogoWSEntryTest < Test::Unit::TestCase
  def test_namespace
    assert_200 'http://togows.dbcls.jp/entry'
  end 
end

class TogoWSSearchTest < Test::Unit::TestCase
  def test_namespace
    assert_200 'http://togows.dbcls.jp/search'
  end 
end

