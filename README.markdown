## Welcome to Active Salesforce

ActiveSalesforce is an extension to the Rails Framework that allows for the dynamic creation and management of ActiveRecord objects through the use of Salesforce meta-data and uses a Salesforce.com organization as the backing store.

### This fork

This repo is a fork of [dchasman activesalesforce] [dchasman] with changes/commits brought in from other repos. The big changes are:

* Original tests are _now working_ and even have assertions(!)
* Bundler is used for dependencies
* [rforce] is no longer included - instead it is a bundler dependency (see Rakefile)
* [rforce] updated to latest version (0.7 at the time of this writing)
* Gem creation is a Rake::GemPackageTask
* [dchasman] had started removing the cumbersome _recording_ implementation. This has been completely removed.
* Check the commits for more details ...

## Getting started

### This is still in active development and is not being pushed to rubygems.org!

#### To use amphora-activerecord-activesalesforce-adapter you can either:

1. Clone the repo and build the gem yourself with:

        rake gem

2. Add a reference to your project using bundler. In your Gemfile:

        gem 'activerecord-activesalesforce-adapter', :git => 'git://github.com/amphora/activerecord-activesalesforce-adapter.git'

#### Then make the configuration changes to your rails application:

1. Edit database.yml

    development:
      adapter: activesalesforce
      url: https://www.salesforce.com
      username: <salesforce user name goes here>
      password: <salesforce password goes here>

    NOTE: If you want to access your Salesforce Sandbox account use https://test.salesforce.com as your url instead.

2. Create your salesforce models using a Salesforce::<ModelName> namespace.

    script/generate model Salesforce::Contact

3. Run a quick test to make sure things are working

        > script/console
        Loading development environment (Rails 2.3.3)
    
        >> Salesforce::Contact.first
        => <Salesforce::Contact id: "003T000000GqvJsIAJ", ... >

4. Proceed using standard Rails development techniques!

## Advanced Features

1. Session ID based Authentication: Add the following to /app/controllers/application.rb to enable SID auth for all controllers

        class ApplicationController < ActionController::Base
          before_filter ActiveSalesforce::SessionIDAuthenticationFilter
        end

2. Boxcar'ing of updates, inserts, and deletes. Use <YourModel>.transaction() to demark boxcar boundaries.

## Description of contents

lib
 Application specific libraries. Basically, any kind of custom code that doesn't
 belong under controllers, models, or helpers. This directory is in the load path.

script
 Helper scripts for automation and generation.

test
 Unit and functional tests. (These are really _functional_ tests as they require a connection to Salesforce in order to run.)


[dchasman]: https://github.com/dchasman/activerecord-activesalesforce-adapter
[rforce]: https://github.com/undees/rforce
