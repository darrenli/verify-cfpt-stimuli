#!/bin/bash
rm *.gem
gem build verify-ooo.gemspec
gem build verify-cfpt.gemspec
gem push verify-ooo-*.gem
gem push verify-cfpt-*.gem
