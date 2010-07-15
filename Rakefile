namespace :create do
  desc 'Make testcode file with namespace=ebi_uniprot NAMESPACE=UniProt EntryID=P53_HUMEN SearchQuery=cancer'
  task :testcode do
    tnamespace = ENV['namespace']
    TNAMESPACE = ENV['NAMESPACE']
    TEntryID = ENV['EntryID']
    TSearchQuery = ENV['SearchQuery']
    require 'erb'
    t = ERB.new(File.open("test-togows-rest-template.erb").read, nil, 2)
    puts t.result(binding)
  end
end

namespace :testcode do
  desc 'Create test-togows-rest-ebi-uniprot.rb'
  task :uniprot do
    sh 'rake -s create:testcode namespace=ebi-uniprot NAMESPACE=UniProt EntryID=P53_HUMAN SearchQuery=cancer'
  end

  desc 'Create test-togows-rest-ncbi-pubmed.rb'
  task :pubmed do
    sh 'rake -s create:testcode namespace=ncbi-pubmed NAMESPACE=PubMed EntryID=20472643 SearchQuery=togows'
  end
end


namespace :extract do
  desc 'Extract URIs in testcode files'
  task 'uris' do
    uri_set = []
    Dir.glob("test-*.rb").each do |file|
      uris = File.open(file).read.scan(/(http:.+?)\'/)
      uris.each do |uri|
        uri_set << uri.to_s
      end
    end
    puts uri_set.uniq
  end
end

