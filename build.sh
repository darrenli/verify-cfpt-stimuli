#!/bin/bash
rm verify-cfpt-stimuli-*.gem
gem build verify-cfpt-stimuli.gemspec
gem install verify-cfpt-stimuli-*.gem
