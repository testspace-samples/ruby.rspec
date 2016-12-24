[![Testspace](http://www.testspace.com/img/Testspace.png)](http://www.testspace.com)

***

## Ruby/RSpec sample for demonstrating Testspace based on the [everydayrails's  repo](https://github.com/everydayrails/rails-4-1-rspec-3-0)

Sample demonstrates techniques for using Testspace with Ruby code and the [`rspec` test framework](http://rspec.info/) together with [`simplecov` code coverage gem](https://github.com/colszowka/simplecov) and [`selenium-webdriver` gem](https://rubygems.org/gems/selenium-webdriver/).

***
Using Multiple Online CI Services:

[![Build Status](https://travis-ci.org/testspace-samples/ruby.rspec.svg?branch=master)](https://travis-ci.org/testspace-samples/ruby.rspec)
[![CircleCI](https://circleci.com/gh/testspace-samples/ruby.rspec.svg?style=svg)](https://circleci.com/gh/testspace-samples/ruby.rspec)
[![Run Status](https://api.shippable.com/projects/5710e82e2a8192902e1c2199/badge?branch=master)](https://app.shippable.com/projects/5710e82e2a8192902e1c2199)


***
Publishing **Test Content** using www.testspace.com.

[![Space Health](https://samples.testspace.com/projects/158/spaces/726/badge)](https://samples.testspace.com/projects/158/spaces/726 "Test Cases")
[![Space Metric](https://samples.testspace.com/projects/158/spaces/726/metrics/658/badge)](https://samples.testspace.com/spaces/726/schema/Code%20Coverage "Code Coverage (lines)")
[![Space Metric](https://samples.testspace.com/projects/158/spaces/726/metrics/659/badge)](https://samples.testspace.com/spaces/726/schema/Static%20Analysis "Static Analysis (issues)")

***

In order to run this sample you will need a host workstation that supports the [RSpec test framework](http://rspec.info/) with installed `ruby 2.3.0`, `bundler` and `firefox`.

Running Static Analysis:

<pre>
bundle install
bundle exec rubocop --format emacs --out tmp/rubocop.txt
bundle exec brakeman -o tmp/brakeman.json
bundle exec brakeman_translate_checkstyle_format translate --file="tmp/brakeman.json" > tmp/brakeman_checkstyle.xml
</pre> 

Running Tests with Code Coverage:

<pre>
export CI_REPORTS=$PWD/spec/reports
COVERAGE=true xvfb-run --server-args="-screen 0 1024x768x24" bundle exec rake ci:setup:rspec spec
</pre>

Pushing Content using **Testspace client**: 

<pre>
curl -s https://testspace-client.s3.amazonaws.com/testspace-linux.tgz | sudo tar -zxvf- -C /usr/local/bin
testspace @.testspace.txt $TESTSPACE_TOKEN/$GITHUB_ORG:$REPO_NAME/$BRANCH_NAME#$BUILD_NUMBER
</pre> 


Checkout the published [Test Content](https://samples.testspace.com/projects/testspace-samples:ruby.rspec). Note that the `.testspace.txt` file contains the [set of files](http://help.testspace.com/how-to:publish-content#publishing-via-content-list-file) to publish. 

***

To replicate this sample: 
  - Setup account at www.testspace.com.
  - Create a Environment variable called `TESTSPACE_TOKEN`
     - `TESTSPACE_TOKEN` = `credentials@Your-Org-Name.testspace.com`
     - `credentials` set to `username:password` or your [access token](http://help.testspace.com/reference:client-reference#login-credentials)
     - To [use Testspace with a CI system](http://help.testspace.com/how-to:add-to-ci-workflow), store `TESTSPACE_TOKEN` as a secure environment variable
