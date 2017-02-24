Gem::Specification.new do |s|
  s.name        = 'packer'
  s.version     = '0.1.1'
  s.licenses    = ['MIT']
  s.summary     = ""
  s.description = ""
  s.authors     = ["Francesco Boffa"]
  s.email       = 'fra.boffa@gmail.com'
  s.files       = Dir['lib/**/*.rb'] + Dir['bin/*']
  s.bindir      = 'bin'
  s.executables << 'packer'
end
