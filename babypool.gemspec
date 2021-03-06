# Generated by jeweler
# DO NOT EDIT THIS FILE
# Instead, edit Jeweler::Tasks in Rakefile, and run `rake gemspec`
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{babypool}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jeremy T Hopple", "Benjamin P Blackburne"]
  s.date = %q{2009-10-16}
  s.description = %q{Simple thread pool implementation for Ruby green threads.}
  s.email = %q{jeremy@jthopple.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    ".gitignore",
     "LICENCE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "babypool.gemspec",
     "lib/babypool.rb",
     "test/babypool_test.rb",
     "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/jthopple/babypool}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{A ruby thread pool.}
  s.test_files = [
    "test/babypool_test.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
