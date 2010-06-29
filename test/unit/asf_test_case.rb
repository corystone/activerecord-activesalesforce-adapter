=begin
  ActiveSalesforce
  Copyright 2006 Doug Chasman
 
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at
 
     http://www.apache.org/licenses/LICENSE-2.0
 
  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
=end


require 'rubygems'

require 'test/unit'
require 'set'
require 'pp'

require File.dirname(__FILE__) + '/../../lib/active_record/connection_adapters/activesalesforce_adapter'


module Asf
  module UnitTests

    module ASFTestCase
      LOGGER = Logger.new(STDOUT)
      @@config = YAML.load_file(File.dirname(__FILE__) + '/config.yml').symbolize_keys
    
      def config
        @@config
      end
      
      def setup
        action = { :adapter => 'activesalesforce', :url => config[:url], :username => config[:username], 
          :password => config[:password] }
        
        ActiveRecord::Base.logger = LOGGER
        ActiveRecord::Base.clear_active_connections!
        ActiveRecord::Base.reset_column_information_and_inheritable_attributes_for_all_subclasses
        ActiveRecord::Base.establish_connection(action)
        
        @connection = ActiveRecord::Base.connection
      end
    end
    
  end
end
