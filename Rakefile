namespace :create do
  desc 'Make testcode file with tnamespace=ebi_uniprot TNAMESPACE=UniProt TEntryID=P53_HUMEN TSearchQuery=cancer'
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
    sh 'rake create:testcode tnamespace=ebi-uniprot TNAMESPACE=UniProt TEntryID=P53_HUMAN TSearchQuery=cancer'
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

