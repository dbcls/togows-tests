require 'open-uri'
require 'test/unit'
require 'test-helper'


class TogoWSSearchNucleotideTest < Test::Unit::TestCase
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

class TogoWSEntryNucleotideTest < Test::Unit::TestCase
  def test_fields
    assert_200 'http://togows.dbcls.jp/entry/ncbi-nucleotide?fields'
  end 

  def test_fields_list
    list = ["entry_id", "length", "strand", "moltype", "linearity", "division", "date",
            "definition", "accession", "accessions", "version", "versions", "acc_version",
            "gi", "keywords", "organism", "common_name", "taxonomy", "comment", "seq"]
    assert_list(list, 'http://togows.dbcls.jp/entry/ncbi-nucleotide?fields')
  end 

  def test_formats
    assert_200 'http://togows.dbcls.jp/entry/ncbi-nucleotide?formats'
  end

  def test_formats_list
    list = ['fasta', 'gff', 'json', 'xml']
    assert_list(list, 'http://togows.dbcls.jp/entry/ncbi-nucleotide?formats')
  end

  def test_not_found
    assert_404 'http://togows.dbcls.jp/entry/ncbi-nucleotide/not_found'
  end

  def test_bad_request
    assert_400 'http://togows.dbcls.jp/entry/ncbi-nucleotide/BA000022/bad_request'
  end

  def test_ncbi_nucleotide
    assert_200 'http://togows.dbcls.jp/entry/ncbi-nucleotide/BA000022'
  end

  def test_in_fasta
    assert_200 'http://togows.dbcls.jp/entry/ncbi-nucleotide/BA000022.fasta'
  end

  def test_in_gff
    assert_200 'http://togows.dbcls.jp/entry/ncbi-nucleotide/BA000022.json'
  end

  def test_in_json
    assert_200 'http://togows.dbcls.jp/entry/ncbi-nucleotide/BA000022.json'
  end

  def test_in_xml
    assert_200 'http://togows.dbcls.jp/entry/ncbi-nucleotide/BA000022.xml'
  end

  def test_entry_id
    assert_200 'http://togows.dbcls.jp/entry/ncbi-nucleotide/BA000022/entry_id'
  end

  def test_entry_id_in_json
    assert_200 'http://togows.dbcls.jp/entry/ncbi-nucleotide/BA000022/entry_id.json'
  end

  def test_length
    assert_200 'http://togows.dbcls.jp/entry/ncbi-nucleotide/BA000022/length'
  end
  
  def test_strand
    assert_404 'http://togows.dbcls.jp/entry/ncbi-nucleotide/BA000022/strand'
  end
  
  def test_moltype
    assert_200 'http://togows.dbcls.jp/entry/ncbi-nucleotide/BA000022/moltype'
  end

  def test_linearity
    assert_200 'http://togows.dbcls.jp/entry/ncbi-nucleotide/BA000022/linearity'
  end

  def test_division
    assert_200 'http://togows.dbcls.jp/entry/ncbi-nucleotide/BA000022/division'
  end

  def test_date
    assert_200 'http://togows.dbcls.jp/entry/ncbi-nucleotide/BA000022/date'
  end

  def test_definition
    assert_200 'http://togows.dbcls.jp/entry/ncbi-nucleotide/BA000022/definition'
  end

  def test_definition_in_json
    assert_200 'http://togows.dbcls.jp/entry/ncbi-nucleotide/BA000022/definition.json'
  end

  def test_accession
    assert_200 'http://togows.dbcls.jp/entry/ncbi-nucleotide/BA000022/accession'
  end

  def test_accessions
    assert_200 'http://togows.dbcls.jp/entry/ncbi-nucleotide/BA000022/accessions'
  end
  
  def test_version
    assert_200 'http://togows.dbcls.jp/entry/ncbi-nucleotide/BA000022/version'
  end
  
  def test_versions
    assert_200 'http://togows.dbcls.jp/entry/ncbi-nucleotide/BA000022/versions'
  end

  def test_acc_version
    assert_200 'http://togows.dbcls.jp/entry/ncbi-nucleotide/BA000022/acc_version'
  end

  def test_gi
    assert_200 'http://togows.dbcls.jp/entry/ncbi-nucleotide/BA000022/gi'
  end
  
  def test_keywords
    assert_404 'http://togows.dbcls.jp/entry/ncbi-nucleotide/BA000022/keywords'
  end

  def test_organism
    assert_200 'http://togows.dbcls.jp/entry/ncbi-nucleotide/BA000022/organism'
  end

  def test_common_name
    assert_200 'http://togows.dbcls.jp/entry/ncbi-nucleotide/BA000022/common_name'
  end

  def test_taxonomy
    assert_200 'http://togows.dbcls.jp/entry/ncbi-nucleotide/BA000022/taxonomy'
  end

  def test_comment
    assert_200 'http://togows.dbcls.jp/entry/ncbi-nucleotide/BA000022/comment'
  end

  def test_seq
    assert_200 'http://togows.dbcls.jp/entry/ncbi-nucleotide/BA000022/seq'
  end
end

class TogoWSEntryNucleotideAliasNCBIGenBankTest < Test::Unit::TestCase  
  def test_nucleotide
    assert_200 'http://togows.dbcls.jp/entry/nucleotide/BA000022'
  end
  def test_definition
    assert_200 'http://togows.dbcls.jp/entry/nucleotide/BA000022/definition'
  end
  def test_entry_id
    assert_200 'http://togows.dbcls.jp/entry/nucleotide/BA000022/entry_id'
  end
  def test_entry_id_in_json
    assert_200 'http://togows.dbcls.jp/entry/nucleotide/BA000022/entry_id.json'
  end
end

class TogoWSEntryNucleotideAliasNCBIGenBankTest < Test::Unit::TestCase  
  def test_ncbi_genbank
    assert_200 'http://togows.dbcls.jp/entry/ncbi-genbank/BA000022'
  end
  def test_in_fasta
    assert_200 'http://togows.dbcls.jp/entry/ncbi-genbank/BA000022.fasta'
  end
  def test_in_json
    assert_200 'http://togows.dbcls.jp/entry/ncbi-genbank/BA000022.json'
  end
  def test_entry_id
    assert_200 'http://togows.dbcls.jp/entry/ncbi-genbank/BA000022/entry_id'
  end
  def test_entry_id_in_json
    assert_200 'http://togows.dbcls.jp/entry/ncbi-genbank/BA000022/entry_id.json'
  end
end

class TogoWSEntryNucleotideAliasGenBankTest < Test::Unit::TestCase
  def test_genbank
    assert_200 'http://togows.dbcls.jp/entry/genbank/BA000022'
  end
  def test_in_fasta
    assert_200 'http://togows.dbcls.jp/entry/genbank/BA000022.fasta'
  end
  def test_in_json
    assert_200 'http://togows.dbcls.jp/entry/genbank/BA000022.json'
  end
  def test_entry_id
    assert_200 'http://togows.dbcls.jp/entry/genbank/BA000022/entry_id'
  end
  def test_entry_id_in_json
    assert_200 'http://togows.dbcls.jp/entry/genbank/BA000022/entry_id.json'
  end
end

