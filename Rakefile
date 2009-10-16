require 'rake'
 
$LOAD_PATH.unshift('lib')
 
require 'rake/testtask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = 'babypool'
    gemspec.summary = "A ruby thread pool."
    gemspec.description = "Simple thread pool implementation for Ruby green threads."
    gemspec.authors = ["Jeremy T Hopple", "Benjamin P Blackburne"]
    gemspec.email = "jeremy@jthopple.com"
    gemspec.homepage = "http://github.com/jthopple/babypool"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

test_files_pattern = 'test/**/*_test.rb'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = test_files_pattern
  t.verbose = true
end 
 
desc "Run code-coverage analysis using rcov"
task :rcov do
  rm_rf "coverage"
  files = Dir[test_files_pattern]
  system "rcov -T --sort coverage -x shoulda,rcov -Ilib #{files.join(' ')}"
end

desc 'Default: run tests.'
task :default => ['test']