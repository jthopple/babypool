spec = Gem::Specification.new do |s|
  s.name = 'Babypool'
  s.version = '0.1.0'
  s.summary = "Babypool - a ruby thread pool."
  s.description = %{Simple thread pool implementation for Ruby green threads.}
  s.files = Dir['lib/**/*.rb'] + Dir['test/**/*.rb']
  s.require_path = 'lib'
  s.autorequire = 'Babypool'
  s.has_rdoc = true
  s.extra_rdoc_files = ["README.rdoc"]
  s.rdoc_options << '--title' << 'Babypool - a ruby thread pool.'
  s.author = "Jeremy T Hopple, Benjamin P Blackburne"
  s.email = "jeremy@jthopple.com"
  s.homepage = "http://github.com/jthopple/Babypool"
end
