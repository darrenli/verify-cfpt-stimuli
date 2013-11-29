#!/bin/bash
rm *.gem
gem build verify-ooo.gemspec
gem build verify-cfpt.gemspec
gem install verify-cfpt-*.gem
gem install verify-ooo-*.gem
