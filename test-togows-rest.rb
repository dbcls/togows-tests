require 'open-uri'
require 'test/unit'


class TogoWSEntryTest < Test::Unit::TestCase
  def test_namespace
    @r = open('http://togows.dbcls.jp/entry')
    assert_equal('200', @r.status.first)
  end 
end

class TogoWSSearchTest < Test::Unit::TestCase
  def test_namespace
    @r = open('http://togows.dbcls.jp/search')
    assert_equal('200', @r.status.first)
  end 
end

