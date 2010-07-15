require 'open-uri'
require 'test/unit'
require 'test-helper'


class TogoWSSearchUniProtTest < Test::Unit::TestCase
  def test_search
    assert_404 'http://togows.dbcls.jp/search/ebi-uniprot'
  end 

  def test_query
    assert_200 'http://togows.dbcls.jp/search/ebi-uniprot/cancer'
  end 

  def test_count
    @r = open('http://togows.dbcls.jp/search/ebi-uniprot/cancer/count')
    assert_equal('200', @r.status.first)
    assert(7 <= @r.read.to_i)
  end 

  def test_offset_limit
    @r = open('http://togows.dbcls.jp/search/ebi-uniprot/cancer/10,10')
    assert_equal('200', @r.status.first)
    assert_equal(10, @r.read.split("\n").size)
  end 

  def test_offset_limit_100
    @r = open('http://togows.dbcls.jp/search/ebi-uniprot/cancer/10,100')
    assert_equal('200', @r.status.first)
    assert_equal(100, @r.read.split("\n").size)
  end 

  def test_the_last_without_n
    @r = open('http://togows.dbcls.jp/search/ebi-uniprot/cancer/10,10')
    assert_equal('200', @r.status.first)
    assert_equal(nil, @r.read =~ /\n$/)
  end 

  def test_offset_limit_2
    @r10 = open('http://togows.dbcls.jp/search/ebi-uniprot/cancer/1,5').read.split("\n")
    @r = [open('http://togows.dbcls.jp/search/ebi-uniprot/cancer/1,1').read,
          open('http://togows.dbcls.jp/search/ebi-uniprot/cancer/2,1').read,
          open('http://togows.dbcls.jp/search/ebi-uniprot/cancer/3,1').read,
          open('http://togows.dbcls.jp/search/ebi-uniprot/cancer/4,1').read,
          open('http://togows.dbcls.jp/search/ebi-uniprot/cancer/5,1').read]
    assert_equal(@r10, @r)
  end 
end

class TogoWSEntryUniProtTest < Test::Unit::TestCase
  def test_fiedls
    assert_200 'http://togows.dbcls.jp/entry/ebi-uniprot?fields'
  end 

  def test_formats
    assert_200 'http://togows.dbcls.jp/entry/ebi-uniprot?formats'
  end

  def test_ebi_uniprot_not_found
    assert_404 'http://togows.dbcls.jp/entry/ebi-uniprot/not_found'
  end
  def test_ebi_uniprot_bad_request
    assert_400 'http://togows.dbcls.jp/entry/ebi-uniprot/Q6K043_HUMAN/bad_request'
  end

  def test_ebi_uniprot
    assert_200 'http://togows.dbcls.jp/entry/ebi-uniprot/Q6K043_HUMAN'
  end
  def test_ebi_uniprot_in_fasta
    assert_200 'http://togows.dbcls.jp/entry/ebi-uniprot/Q6K043_HUMAN.fasta'
  end
  def test_ebi_uniprot_in_json
    assert_200 'http://togows.dbcls.jp/entry/ebi-uniprot/Q6K043_HUMAN.json'
  end
  def test_ebi_uniprot_definition
    assert_200 'http://togows.dbcls.jp/entry/ebi-uniprot/Q6K043_HUMAN/definition'
  end
  def test_ebi_uniprot_entry_id
    assert_200 'http://togows.dbcls.jp/entry/ebi-uniprot/Q6K043_HUMAN/entry_id'
  end
  def test_ebi_uniprot_entry_id_in_json
    assert_200 'http://togows.dbcls.jp/entry/ebi-uniprot/Q6K043_HUMAN/entry_id.json'
  end

end

