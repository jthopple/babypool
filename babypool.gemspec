spec = Gem::Specification.new do |s|
  s.name = 'babypool'
  s.version = '0.1.0'
  s.summary = "BabyPool - a ruby thread pool."
  s.description = %{Simple thread pool implementation for Ruby green threads.}
  s.files = Dir['lib/**/*.rb'] + Dir['test/**/*.rb']
  s.require_path = 'lib'
  s.autorequire = 'babypool'
  s.has_rdoc = true
  s.extra_rdoc_files = ["README"]
  s.rdoc_options << '--title' << 'BabyPool - a ruby thread pool.'
  s.author = "Jeremy T Hopple, Benjamin P Blackburne"
  s.email = "jeremy@jthopple.com"
  s.homepage = "http://github.com/jthopple/babypool"
end
