require 'open-uri'
require 'test/unit'


class TogoWSEntryTest < Test::Unit::TestCase
  def test_namespace
    @r = open('http://togows.dbcls.jp/entry')
    assert_equal('200', @r.status.first)
  end 
end


class TogoWSEntryGenBankTest < Test::Unit::TestCase
  def test_fiedls
    @r = open('http://togows.dbcls.jp/entry/ncbi-nucleotide?fields')
    assert_equal('200', @r.status.first)
  end 

  def test_formats
    @r = open('http://togows.dbcls.jp/entry/ncbi-nucleotide?formats')
    assert_equal('200', @r.status.first)
  end

  def test_ncbi_nucleotide_not_found
    e = assert_raise(OpenURI::HTTPError) {
      @r = open('http://togows.dbcls.jp/entry/ncbi-nucleotide/not_found')
    }
    assert_equal('404 Not Found', e.message)
  end
  def test_ncbi_nucleotide_bad_request
    e = assert_raise(OpenURI::HTTPError) {
      @r = open('http://togows.dbcls.jp/entry/ncbi-nucleotide/BA000022/bad_request')
    }
    assert_equal('400 Bad Request', e.message)
  end

  def test_ncbi_nucleotide_
    @r = open('http://togows.dbcls.jp/entry/ncbi-nucleotide/BA000022')
    assert_equal('200', @r.status.first)
  end
  def test_ncbi_nucleotide_fasta
    @r = open('http://togows.dbcls.jp/entry/ncbi-nucleotide/BA000022.fasta')
    assert_equal('200', @r.status.first)
  end
  def test_ncbi_nucleotide_json
    @r = open('http://togows.dbcls.jp/entry/ncbi-nucleotide/BA000022.json')
    assert_equal('200', @r.status.first)
  end
  def test_ncbi_nucleotide_definition_
    @r = open('http://togows.dbcls.jp/entry/ncbi-nucleotide/BA000022/definition')
    assert_equal('200', @r.status.first)
  end
  def test_ncbi_nucleotide_entry_id_
    @r = open('http://togows.dbcls.jp/entry/ncbi-nucleotide/BA000022/entry_id')
    assert_equal('200', @r.status.first)
  end
  def test_ncbi_nucleotide_entry_id_json
    @r = open('http://togows.dbcls.jp/entry/ncbi-nucleotide/BA000022/entry_id.json')
    assert_equal('200', @r.status.first)
  end


  def test_nucleotide_
    @r = open('http://togows.dbcls.jp/entry/nucleotide/BA000022')
    assert_equal('200', @r.status.first)
  end
  def test_nucleotide_definition_
    @r = open('http://togows.dbcls.jp/entry/nucleotide/BA000022/definition')
    assert_equal('200', @r.status.first)
  end
  def test_nucleotide_entry_id_
    @r = open('http://togows.dbcls.jp/entry/nucleotide/BA000022/entry_id')
    assert_equal('200', @r.status.first)
  end
  def test_nucleotide_entry_id_json
    @r = open('http://togows.dbcls.jp/entry/nucleotide/BA000022/entry_id.json')
    assert_equal('200', @r.status.first)
  end

  def test_ncbi_genbank_
    @r = open('http://togows.dbcls.jp/entry/ncbi-genbank/BA000022')
    assert_equal('200', @r.status.first)
  end
  def test_ncbi_genbank_fasta
    @r = open('http://togows.dbcls.jp/entry/ncbi-genbank/BA000022.fasta')
    assert_equal('200', @r.status.first)
  end
  def test_ncbi_genbank_json
    @r = open('http://togows.dbcls.jp/entry/ncbi-genbank/BA000022.json')
    assert_equal('200', @r.status.first)
  end
  def test_ncbi_genbank_entry_id
    @r = open('http://togows.dbcls.jp/entry/ncbi-genbank/BA000022/entry_id')
    assert_equal('200', @r.status.first)
  end
  def test_ncbi_genbank_entry_id_json
    @r = open('http://togows.dbcls.jp/entry/ncbi-genbank/BA000022/entry_id.json')
    assert_equal('200', @r.status.first)
  end

  def test_genbank_
    @r = open('http://togows.dbcls.jp/entry/genbank/BA000022')
    assert_equal('200', @r.status.first)
  end
  def test_genbank_fasta
    @r = open('http://togows.dbcls.jp/entry/genbank/BA000022.fasta')
    assert_equal('200', @r.status.first)
  end
  def test_genbank_json
    @r = open('http://togows.dbcls.jp/entry/genbank/BA000022.json')
    assert_equal('200', @r.status.first)
  end
  def test_genbank_entry_id
    @r = open('http://togows.dbcls.jp/entry/genbank/BA000022/entry_id')
    assert_equal('200', @r.status.first)
  end
  def test_genbank_entry_id_json
    @r = open('http://togows.dbcls.jp/entry/genbank/BA000022/entry_id.json')
    assert_equal('200', @r.status.first)
  end
end

