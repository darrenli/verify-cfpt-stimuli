# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'verify_stimuli/constants'

Gem::Specification.new do |s|
  s.name          = 'verify-ooo'
  s.version       = VerifyStimuli::VERSION
  s.platform      = Gem::Platform::RUBY
  s.authors       = ['Darren Lin Cheng']
  s.email         = 'darren@thanx.com'
  s.homepage      = 'https://github.com/darrenli/verify-perception-stimuli'
  s.summary       = 'Verify OOO Perception Stimuli'
  s.description   = 'OOO stimuli verification tool'
  s.license       = 'MIT'

  s.files         = Dir.glob("{bin,lib}/**/*") + %w(README.md)
  s.executables   = ['ooo']
  s.require_paths = ['lib']

  s.add_dependency 'highline', '~> 1.6.20'
  s.add_dependency 'roo', '~> 1.12.2'
end
