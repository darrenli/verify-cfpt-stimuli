# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = 'verify-cfpt-stimuli'
  s.version     = "0.0.0"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Darren Lin Cheng']
  s.email       = 'darren@thanx.com'
  s.homepage    = 'https://github.com/darrenli/verify-cfpt-stimuli'
  s.summary     = 'Verify CFPT Stimuli'
  s.description = 'CFPT stimuli verification tool'
  s.license     = 'MIT'

  s.files       = Dir.glob("{bin,lib}/**/*") + %w(README.md)
  s.executables = ['cfpt']
  s.require_paths = ['lib']

  s.add_dependency 'thor', '~> 0.18.1'
  s.add_dependency 'highline', '~> 1.6.20'
  s.add_dependency 'roo', '~> 1.12.2'
end
