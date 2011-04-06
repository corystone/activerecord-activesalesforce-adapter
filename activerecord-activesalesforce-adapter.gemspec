# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{activerecord-activesalesforce-adapter}
  s.version = "2.3.7.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Doug Chasman", "Luigi Montanez", "Senthil Nayagam", "Justin Ball", "Jesse Hallett", "Andrew Freeberg", "Don Morrison"]
  s.date = %q{2011-04-06}
  s.email = %q{elskwid@gmail.com}
  s.extra_rdoc_files = ["README.markdown"]
  s.files = ["Rakefile", "README.markdown", "test/config.yml.example", "test/functional", "test/functional/basic_test.rb", "test/test_helper.rb", "test/unit", "test/unit/some_unit_test.rb", "lib/active_record", "lib/active_record/connection_adapters", "lib/active_record/connection_adapters/activesalesforce.rb", "lib/active_record/connection_adapters/activesalesforce_adapter.rb", "lib/active_record/connection_adapters/asf_active_record.rb", "lib/active_record/connection_adapters/boxcar_command.rb", "lib/active_record/connection_adapters/column_definition.rb", "lib/active_record/connection_adapters/entity_definition.rb", "lib/active_record/connection_adapters/id_resolver.rb", "lib/active_record/connection_adapters/relationship_definition.rb", "lib/active_record/connection_adapters/result_array.rb", "lib/active_record/connection_adapters/sid_authentication_filter.rb", "lib/activerecord-activesalesforce-adapter.rb"]
  s.homepage = %q{http://github.com/amphora/activerecord-activesalesforce-adapter}
  s.post_install_message = %q{This version is a merge of the mainline activesalesforce with althor880 fork with some bits and pieces from other forks.
  It is compatible with Rails ~> 2.3.8. NOT Rails 3 compat. Please report any bug in the group
  http://groups.google.com/group/activesalesforce
  }
  s.rdoc_options = ["--main", "README.markdown"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{ActiveSalesforce (ASF) is a Rails connection adapter that provides direct access to Salesforce.com hosted data and metadata via the ActiveRecord model layer. Objects, fields, and relationships are all auto surfaced as active record attributes and rels.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["~> 2.3.8"])
      s.add_runtime_dependency(%q<rforce>, ["~> 0.4"])
    else
      s.add_dependency(%q<rails>, ["~> 2.3.8"])
      s.add_dependency(%q<rforce>, ["~> 0.4"])
    end
  else
    s.add_dependency(%q<rails>, ["~> 2.3.8"])
    s.add_dependency(%q<rforce>, ["~> 0.4"])
  end
end
