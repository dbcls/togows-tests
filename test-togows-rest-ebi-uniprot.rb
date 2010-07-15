require 'open-uri'
require 'test/unit'
require 'test-helper'


class TogoWSSearchUniProtTest < Test::Unit::TestCase
  def test_ebi_uniprot
    assert_404 'http://togows.dbcls.jp/search/ebi-uniprot'
  end 

  def test_uniprot
    assert_404 'http://togows.dbcls.jp/search/uniprot'
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
  def test_fields
    assert_200 'http://togows.dbcls.jp/entry/ebi-uniprot?fields'
  end 

  def test_fields_list
    list = ['definition', 'entry_id', 'seq']
    assert_list(list, 'http://togows.dbcls.jp/entry/ebi-uniprot?fields')
  end 

  def test_formats
    assert_200 'http://togows.dbcls.jp/entry/ebi-uniprot?formats'
  end

  def test_formats_list
    list = ['fasta', 'gff', 'json', 'xml']
    assert_list(list, 'http://togows.dbcls.jp/entry/ebi-uniprot?formats')
  end 

  def test_not_found
    assert_404 'http://togows.dbcls.jp/entry/ebi-uniprot/not_found'
  end

  def test_field_bad_request
    assert_400 'http://togows.dbcls.jp/entry/ebi-uniprot/Q6K043_HUMAN/bad_request'
  end

  def test_format_bad_request
    assert_400 'http://togows.dbcls.jp/entry/ebi-uniprot/Q6K043_HUMAN.bad_request'
  end

  def test_ebi_uniprot
    assert_200 'http://togows.dbcls.jp/entry/ebi-uniprot/Q6K043_HUMAN'
  end

  def test_uniprot
    assert_200 'http://togows.dbcls.jp/entry/uniprot/Q6K043_HUMAN'
  end

  def test_in_fasta
    assert_200 'http://togows.dbcls.jp/entry/ebi-uniprot/Q6K043_HUMAN.fasta'
  end

  def test_in_json
    assert_200 'http://togows.dbcls.jp/entry/ebi-uniprot/Q6K043_HUMAN.json'
  end

  def test_in_gff
    assert_200 'http://togows.dbcls.jp/entry/ebi-uniprot/Q6K043_HUMAN.gff'
  end

  def test_in_xml
    assert_200 'http://togows.dbcls.jp/entry/ebi-uniprot/Q6K043_HUMAN.xml'
  end

  def test_definition
    assert_200 'http://togows.dbcls.jp/entry/ebi-uniprot/Q6K043_HUMAN/definition'
  end

  def test_definition
    assert_200 'http://togows.dbcls.jp/entry/ebi-uniprot/Q6K043_HUMAN/definition.json'
  end

  def test__entry_id
    assert_200 'http://togows.dbcls.jp/entry/ebi-uniprot/Q6K043_HUMAN/entry_id'
  end

  def test__entry_id_in_json
    assert_200 'http://togows.dbcls.jp/entry/ebi-uniprot/Q6K043_HUMAN/entry_id.json'
  end

  def test__seq
    assert_200 'http://togows.dbcls.jp/entry/ebi-uniprot/Q6K043_HUMAN/seq'
  end

  def test_seq_in_json
    assert_200 'http://togows.dbcls.jp/entry/ebi-uniprot/Q6K043_HUMAN/seq.json'
  end

end

