#!/bin/bash

# Build
gem install bundler
bundle install

# Analysis
bundle exec rubocop --format emacs --out tmp/rubocop.txt
bundle exec brakeman -o tmp/brakeman.json
bundle exec brakeman_translate_checkstyle_format translate --file="tmp/brakeman.json" > tmp/brakeman_checkstyle.xml

# Test
COVERAGE=true xvfb-run --server-args="-screen 0 1024x768x24" bundle exec rake ci:setup:rspec spec

# Download and configure the Testspace client
mkdir -p $HOME/bin
curl -fsSL https://testspace-client.s3.amazonaws.com/testspace-linux.tgz | tar -zxvf- -C $HOME/bin
# note c9 host requires "access token", storing in ~/.netrc (refer to https://help.testspace.com/reference:client-reference#login-credentials)
CI=true testspace config url samples.testspace.com

# Push content
#  using "list file" because 5 items being pushed
CI_REPORTS=$PWD/spec/reports testspace @.testspace.txt "#c9.Build" --repo git
