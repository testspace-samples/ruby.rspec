[![Testspace](http://www.testspace.com/public/img/testspace_logo.png)](http://www.testspace.com)
***

## Ruby/RSpec sample for demonstrating Testspace based on the [everydayrails's  repo](https://github.com/everydayrails/rails-4-1-rspec-3-0)

Sample demonstrates techniques for using Testspace with Ruby code and the [`rspec` test framework](http://rspec.info/) together with [`simplecov` code coverage gem](https://github.com/colszowka/simplecov) and [`selenium-webdriver` gem](https://rubygems.org/gems/selenium-webdriver/).

[![Build Status](https://travis-ci.org/testspace-samples/ruby.rspec.svg?branch=master)](https://travis-ci.org/testspace-samples/ruby.rspec)
[![Space Health](https://samples.testspace.com/projects/85/spaces/312/badge)](https://samples.testspace.com/projects/85/spaces/312 "Test Cases")
[![Space Metric](https://samples.testspace.com/projects/85/spaces/312/metrics/216/badge)](https://samples.testspace.com/projects/85/spaces/312/metrics#metric-216 "Line/Statement Coverage")

***

In order to run this sample you will need a host workstation with installed `ruby 2.3.0`, `bundler` and `firefox`.

<pre>
bundle update
COVERAGE=true bundle exec rake ci:setup:rspec spec
</pre>

Publishing results example: 

<pre>
testspace publish [Tests]spec/reports/*.xml{spec} coverage/coverage.xml 
</pre> 

Checkout the [Space](https://samples.testspace.com/projects/ruby/spaces/rspec). 

***

To fork this example using Travis requires:
  - Account at www.testspace.com.
  - Travis Environment Variable: 
    - `TESTSPACE_URL` = `credentials:@my-org-name.testspace.com/my-project/my-space`
    - `credentials` set to `username:password` or your [access token](http://help.testspace.com/using-your-organization:user-settings).
    - `my-org-name.testspace.com/my-project/my-space` based on your subdomain, project, and space names. Refer [here](http://help.testspace.com/reference:runner-reference#login-credentials) for more details. 
