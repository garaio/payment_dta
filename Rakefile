require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "payment_dta"
    gem.summary = "Ruby library to generate Swiss DTA payment files"
    gem.description = "Generate Swiss DTA payment files to extract payments from your existing application"
    gem.email = "patrick.huesler@gmail.com"
    gem.homepage = "http://github.com/phuesler/payment_dta"
    gem.authors = ["Patrick Huesler"]
    gem.files = FileList[
      "lib/**/*.rb",
      "generators/**/*",
      "LICENSE",
      "README.rdoc",
      "VERSION",
      "script/*"
    ]
    gem.test_files = FileList[
      "spec/**/*.rb"
    ]
    gem.add_development_dependency "rspec"
    gem.add_development_dependency "rubigen"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  if File.exist?('VERSION')
    version = File.read('VERSION')
  else
    version = ""
  end

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "payment_dta #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
