[![Testspace](http://www.testspace.com/public/img/testspace_logo.png)](http://www.testspace.com)
***

## Ruby/RSpec sample for demonstrating Testspace based on the [everydayrails's  repo](https://github.com/everydayrails/rails-4-1-rspec-3-0)

Sample demonstrates techniques for using Testspace with Ruby code and the [`rspec` test framework](http://rspec.info/) together with [`simplecov` code coverage gem](https://github.com/colszowka/simplecov) and [`selenium-webdriver` gem](https://rubygems.org/gems/selenium-webdriver/).

***
Using Multiple Online CI Services:

[![Build Status](https://travis-ci.org/munderseth/ruby.rspec.svg?branch=master)](https://travis-ci.org/munderseth/ruby.rspec)
[![CircleCI](https://circleci.com/gh/munderseth/ruby.rspec.svg?style=svg)](https://circleci.com/gh/munderseth/ruby.rspec)
[![Run Status](https://api.shippable.com/projects/57c59c86d69e8d0f0053cfd4/badge?branch=master)](https://app.shippable.com/projects/57c59c86d69e8d0f0053cfd4)

***
Publishing **Test Content** using www.testspace.com.

[![Space Health](http://munderseth.stridespace.com/projects/271/spaces/906/badge)](http://munderseth.stridespace.com/projects/271/spaces/906 "Test Cases")
[![Space Metric](http://munderseth.stridespace.com/projects/271/spaces/906/metrics/334/badge)](http://munderseth.stridespace.com/spaces/906/schema/Code%20Coverage "Code Coverage (lines)")
[![Space Metric](http://munderseth.stridespace.com/projects/271/spaces/906/metrics/335/badge)](http://munderseth.stridespace.com/spaces/906/schema/Static%20Analysis "Static Analysis (issues)")

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

Publishing Results using **Testspace**: 

<pre>
curl -s https://testspace-client.s3.amazonaws.com/testspace-linux.tgz | sudo tar -zxvf- -C /usr/local/bin
testspace @.testspace $TESTSPACE_TOKEN/$BRANCH_NAME
</pre> 


Checkout the [Space](http://munderseth.stridespace.com/projects/ruby.rspec). 

***
To replicate this sample: 
  - Account at www.testspace.com.
  - Environment Variable called `TESTSPACE_TOKEN`:
    - `credentials` set to `username:password` or your [access token](http://help.testspace.com/using-your-organization:user-settings).
    - `my-org-name.testspace.com/my-project/my-space` based on your subdomain, project, and space names. Refer [here](http://help.testspace.com/reference:runner-reference#login-credentials) for more details. 
  