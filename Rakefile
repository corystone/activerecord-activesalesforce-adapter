Dir['tasks/**/*.rake'].each { |t| load t }

require "rubygems"
require "rake/gempackagetask"
require "rake/rdoctask"

require "rake/testtask"
Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList["test/**/*_test.rb"]
  t.verbose = true
end


task :default => ["test"]

# This builds the actual gem. For details of what all these options
# mean, and other ones you can add, check the documentation here:
#
#   http://rubygems.org/read/chapter/20
#
spec = Gem::Specification.new do |s|

  # Change these as appropriate
  s.name              = "activerecord-activesalesforce-adapter"
  s.version           = "2.3.7.1"
  s.summary           = %q{ActiveSalesforce (ASF) is a Rails connection adapter that provides direct access to Salesforce.com hosted data and metadata via the ActiveRecord model layer. Objects, fields, and relationships are all auto surfaced as active record attributes and rels.  }
  s.authors           = ["Doug Chasman", "Luigi Montanez", "Senthil Nayagam", "Justin Ball", "Jesse Hallett", "Andrew Freeberg", "Don Morrison"]
  s.email             = "elskwid@gmail.com"
  s.homepage          = "http://github.com/amphora/activerecord-activesalesforce-adapter"

  s.has_rdoc          = false
  s.extra_rdoc_files  = %w(README)
  s.rdoc_options      = %w(--main README.md)

  # Add any extra files to include in the gem
  s.files             = %w(LICENSE Rakefile README.md) + Dir.glob("{test,lib}/**/*")
  s.require_paths     = ["lib"]

  # If you want to depend on other gems, add them here, along with any
  # relevant versions
  s.add_dependency("rails",   "~> 2.3.3")
  s.add_dependency("builder", ">= 1.2.4")
  s.add_dependency("hpricot", ">= 0.8.2")

  # If your tests use any gems, include them here
  # s.add_development_dependency("mocha") # for example
  
  s.post_install_message = %q{This version is a merge of the mainline activesalesforce with althor880 fork.
  It is compatible with Rails >= 2.3.3. NOT Rails 3 compat. Please report any bug in the group
  http://groups.google.com/group/activesalesforce
  }
end

# This task actually builds the gem. We also regenerate a static
# .gemspec file, which is useful if something (i.e. GitHub) will
# be automatically building a gem for this project. If you're not
# using GitHub, edit as appropriate.
Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc "Build the gemspec file #{spec.name}.gemspec"
task :gemspec do
  file = File.dirname(__FILE__) + "/#{spec.name}.gemspec"
  File.open(file, "w") {|f| f << spec.to_ruby }
end

# If you don't want to generate the .gemspec file, just remove this line. Reasons
# why you might want to generate a gemspec:
#  - using bundler with a git source
#  - building the gem without rake (i.e. gem build blah.gemspec)
#  - maybe others?
task :package => :gemspec

# Generate documentation
Rake::RDocTask.new do |rd|
  rd.main = "README.md"
  rd.rdoc_files.include("README.md", "lib/**/*.rb")
  rd.rdoc_dir = "rdoc"
end

desc 'Clear out RDoc and generated packages'
task :clean => [:clobber_rdoc, :clobber_package] do
  rm "#{spec.name}.gemspec"
end
