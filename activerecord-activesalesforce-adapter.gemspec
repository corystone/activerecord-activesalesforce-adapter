Gem::Specification.new do |s|
  s.name = "activerecord-activesalesforce-adapter"
  s.version = "2.3.0"
  s.authors = ["Doug Chasman","Luigi Montanez","Senthil Nayagam","Justin Ball","Jesse Hallett"]
  s.date = "2008-12-19"
  s.summary = %q{ActiveSalesforce (ASF) is a Rails connection adapter that provides direct access to Salesforce.com hosted data and metadata via the ActiveRecord model layer. Objects, fields, and relationships are all auto surfaced as active record attributes and rels.  }
  s.email = "dchasman@salesforce.com"
  s.rubyforge_project = "http://rubyforge.org/projects/activesfdc/"
  s.homepage = "http://activesfdc.rubyforge.org/"
  s.has_rdoc = true
  s.extra_rdoc_files = ["README"]
  s.post_install_message = %q{this version is compatible with Rails 2.1,
  please report any bug in the group
  http://groups.google.com/group/activesalesforce
  }
  s.files = [
    "lib/active_record",
    "lib/active_record/connection_adapters",
    "lib/active_record/connection_adapters/rforce.rb",
    "lib/active_record/connection_adapters/relationship_definition.rb",
    "lib/active_record/connection_adapters/result_array.rb",
    "lib/active_record/connection_adapters/activesalesforce_adapter.rb",
    "lib/active_record/connection_adapters/asf_active_record.rb",
    "lib/active_record/connection_adapters/column_definition.rb",
    "lib/active_record/connection_adapters/id_resolver.rb",
    "lib/active_record/connection_adapters/sid_authentication_filter.rb",
    "lib/active_record/connection_adapters/entity_definition.rb",
    "lib/active_record/connection_adapters/activesalesforce.rb",
    "lib/active_record/connection_adapters/boxcar_command.rb",
    "test/unit",
    "test/unit/config.yml",
    "test/unit/asf_test_case.rb",
    "test/unit/basic_test.rb",
    "README"  ]

  s.add_dependency("rails", [">=2.0.2", "<2.2"])
  s.add_dependency("builder", [">=1.2.4"])

end
