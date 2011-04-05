ENV["RAILS_ENV"] = "test"
$LOAD_PATH << File.expand_path(File.join(File.dirname(__FILE__), "/../lib"))

require 'test/unit'

# project
require 'activerecord-activesalesforce-adapter'

puts ">> test helper!"
module TestHelper
  def self.included(m)
    puts ">> included"
  end
  #
  LOGGER = Logger.new(STDOUT)
  @@config = YAML.load_file(File.dirname(__FILE__) + '/config.yml').symbolize_keys

  def config
    @@config
  end
  
  def connect!
    action = { :adapter => 'activesalesforce',
               :url => config[:url],
               :username => config[:username],
               :password => config[:password] }
    
    ActiveRecord::Base.logger = LOGGER
    ActiveRecord::Base.clear_active_connections!
    ActiveRecord::Base.reset_column_information_and_inheritable_attributes_for_all_subclasses
    ActiveRecord::Base.establish_connection(action)
    
    @connection = ActiveRecord::Base.connection
  end
  
  def reset_header_options
    binding = @connection.binding
    binding.assignment_rule_id = nil
    binding.use_default_rule = false
    binding.update_mru = false
    binding.trigger_user_email = false
  end
end

class Test::Unit::TestCase
  include TestHelper
end

## Test Salesforce module and classes
module Salesforce
  class Contact < ActiveRecord::Base
  end

  class Address < ActiveRecord::Base
  end
  
  class Note < ActiveRecord::Base
  end
  
  class User < ActiveRecord::Base
  end
end