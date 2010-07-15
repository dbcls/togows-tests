namespace :create do
  desc 'Make test_ file with tnamespace=ebi_uniprot TNAMESPACE=UniProt TEntryID=P53_HUMEN TSearchQuery=cancer'
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

desc 'Create test-togows-rest-ebi-uniprot.rb'
task :uniprot_testcode do
  sh 'rake create:testcode tnamespace=ebi-uniprot TNAMESPACE=UniProt TEntryID=P53_HUMAN TSearchQuery=cancer'
end
