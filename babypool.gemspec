Gem::Specification.new do |s|
    s.platform  =   Gem::Platform::RUBY
    s.name      =   "babypool"
    s.version   =   "0.1.0"
    s.author    =   "Jeremy T Hopple, Benjamin P Blackburne"
    s.email     =   "jeremy@jthopple.com"
    s.summary   =   "A simple thread pool."
    s.files     =   FileList['lib/*.rb'].to_a
    s.require_path  =   "lib"
    s.homepage = "http://github.com/jthopple/babypool"
    #s.test_files = Dir.glob('tests/*.rb')
    s.has_rdoc  =   true
    s.extra_rdoc_files  =   ["README"]
end
