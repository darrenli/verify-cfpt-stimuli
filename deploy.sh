#!/bin/bash
rm verify-cfpt-stimuli-*.gem
gem build verify-cfpt-stimuli.gemspec
gem push verify-cfpt-stimuli-*.gem
