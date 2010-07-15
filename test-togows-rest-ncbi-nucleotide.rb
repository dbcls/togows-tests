require 'open-uri'
require 'test/unit'
require 'test-helper'


class TogoWSSearchGenBankNucleotideTest < Test::Unit::TestCase
  def test_query
    assert_200 'http://togows.dbcls.jp/search/ncbi-nucleotide/brest'
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

class TogoWSEntryGenBankNucleotideTest < Test::Unit::TestCase
  def test_fiedls
    assert_200 'http://togows.dbcls.jp/entry/ncbi-nucleotide?fields'
  end 

  def test_formats
    assert_200 'http://togows.dbcls.jp/entry/ncbi-nucleotide?formats'
  end

  def test_ncbi_nucleotide_not_found
    assert_404 'http://togows.dbcls.jp/entry/ncbi-nucleotide/not_found'
  end
  def test_ncbi_nucleotide_bad_request
    assert_400 'http://togows.dbcls.jp/entry/ncbi-nucleotide/BA000022/bad_request'
  end

  def test_ncbi_nucleotide
    assert_200 'http://togows.dbcls.jp/entry/ncbi-nucleotide/BA000022'
  end
  def test_ncbi_nucleotide_in_fasta
    assert_200 'http://togows.dbcls.jp/entry/ncbi-nucleotide/BA000022.fasta'
  end
  def test_ncbi_nucleotide_in_json
    assert_200 'http://togows.dbcls.jp/entry/ncbi-nucleotide/BA000022.json'
  end
  def test_ncbi_nucleotide_definition
    assert_200 'http://togows.dbcls.jp/entry/ncbi-nucleotide/BA000022/definition'
  end
  def test_ncbi_nucleotide_entry_id
    assert_200 'http://togows.dbcls.jp/entry/ncbi-nucleotide/BA000022/entry_id'
  end
  def test_ncbi_nucleotide_entry_id_in_json
    assert_200 'http://togows.dbcls.jp/entry/ncbi-nucleotide/BA000022/entry_id.json'
  end


  def test_nucleotide
    assert_200 'http://togows.dbcls.jp/entry/nucleotide/BA000022'
  end
  def test_nucleotide_definition
    assert_200 'http://togows.dbcls.jp/entry/nucleotide/BA000022/definition'
  end
  def test_nucleotide_entry_id
    assert_200 'http://togows.dbcls.jp/entry/nucleotide/BA000022/entry_id'
  end
  def test_nucleotide_entry_id_in_json
    assert_200 'http://togows.dbcls.jp/entry/nucleotide/BA000022/entry_id.json'
  end

  def test_ncbi_genbank
    assert_200 'http://togows.dbcls.jp/entry/ncbi-genbank/BA000022'
  end
  def test_ncbi_genbank_in_fasta
    assert_200 'http://togows.dbcls.jp/entry/ncbi-genbank/BA000022.fasta'
  end
  def test_ncbi_genbank_in_json
    assert_200 'http://togows.dbcls.jp/entry/ncbi-genbank/BA000022.json'
  end
  def test_ncbi_genbank_entry_id
    assert_200 'http://togows.dbcls.jp/entry/ncbi-genbank/BA000022/entry_id'
  end
  def test_ncbi_genbank_entry_id_in_json
    assert_200 'http://togows.dbcls.jp/entry/ncbi-genbank/BA000022/entry_id.json'
  end

  def test_genbank
    assert_200 'http://togows.dbcls.jp/entry/genbank/BA000022'
  end
  def test_genbank_in_fasta
    assert_200 'http://togows.dbcls.jp/entry/genbank/BA000022.fasta'
  end
  def test_genbank_in_json
    assert_200 'http://togows.dbcls.jp/entry/genbank/BA000022.json'
  end
  def test_genbank_entry_id
    assert_200 'http://togows.dbcls.jp/entry/genbank/BA000022/entry_id'
  end
  def test_genbank_entry_id_in_json
    assert_200 'http://togows.dbcls.jp/entry/genbank/BA000022/entry_id.json'
  end
end

