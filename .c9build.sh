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

# Publish

## Requires TESTSPACE_TOKEN = $ACCESS_TOKEN:@samples.testspace.com

BRANCH_NAME=`git symbolic-ref --short HEAD`
GIT_URL=`git remote show origin -n | grep Fetch\ URL: | sed 's/.*URL: //'`
REPO_SLUG=`echo ${GIT_URL#*github.com?} | sed 's/.git//'`

CI_REPORTS=$PWD/spec/reports testspace @.testspace $TESTSPACE_TOKEN/${REPO_SLUG/\//:}/${BRANCH_NAME}#c9.Build
