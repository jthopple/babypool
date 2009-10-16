require 'rake'
 
$LOAD_PATH.unshift('lib')
 
require 'rake/testtask'

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
  system "rcov -t --sort coverage -x shoulda,rcov -Ilib #{files.join(' ')}"
end

desc 'Default: run tests.'
task :default => ['test']