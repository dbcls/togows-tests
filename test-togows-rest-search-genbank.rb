require 'open-uri'
require 'test/unit'


class TogoWSSearchGenBankTest < Test::Unit::TestCase
  def test_query
    @r = open('http://togows.dbcls.jp/search/ncbi-nucleotide/brest')
    assert_equal('200', @r.status.first)
  end 

  def test_count
    @r = open('http://togows.dbcls.jp/search/ncbi-nucleotide/brest/count')
    assert_equal('200', @r.status.first)
    assert(2771 <= @r.read.to_i)
  end 

  def test_offset_limit
    @r = open('http://togows.dbcls.jp/search/ncbi-nucleotide/brest/10,10')
    assert_equal('200', @r.status.first)
    assert_equal(10, @r.read.split("\n").size)
  end 

  def test_offset_limit_100
    @r = open('http://togows.dbcls.jp/search/ncbi-nucleotide/brest/10,100')
    assert_equal('200', @r.status.first)
    assert_equal(100, @r.read.split("\n").size)
  end 

  def test_the_last_without_n
    @r = open('http://togows.dbcls.jp/search/ncbi-nucleotide/brest/10,10')
    assert_equal('200', @r.status.first)
    assert_equal(nil, @r.read =~ /\n$/)
  end 

  def test_offset_limit_2
    @r10 = open('http://togows.dbcls.jp/search/ncbi-nucleotide/brest/1,5').read.split("\n")
    @r = [open('http://togows.dbcls.jp/search/ncbi-nucleotide/brest/1,1').read,
          open('http://togows.dbcls.jp/search/ncbi-nucleotide/brest/2,1').read,
          open('http://togows.dbcls.jp/search/ncbi-nucleotide/brest/3,1').read,
          open('http://togows.dbcls.jp/search/ncbi-nucleotide/brest/4,1').read,
          open('http://togows.dbcls.jp/search/ncbi-nucleotide/brest/5,1').read]
    assert_equal(@r10, @r)
  end 
end

