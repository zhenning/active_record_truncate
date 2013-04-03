require "active_record_truncate/version"
require "active_record/connection_adapters/abstract_mysql_adapter"


module ActiveRecordTruncate
  
  module Base
    def self.included(base)
      base.send :extend, ClassMethods
    end
    
    module ClassMethods
      def truncate(force = false)
        connection.truncate(table_name, force, "#{name} Truncate")
      end
    end
  end
  
end

module ActiveRecord
  module ConnectionAdapters #:nodoc:
    # Truncate the specified table
    def truncate(table_name)
      execute("TRUNCATE TABLE #{table_name}")
    end
  end
end


module ActiveRecord
  module ConnectionAdapters
    # Adds new functionality to ActiveRecord MysqlAdapter.
    class MysqlAdapter < AbstractAdapter      
      def truncate(table_name, force, name)
        if force
          disable_referential_integrity do
            execute("TRUNCATE TABLE #{table_name}", name)
          end
        else
          execute("TRUNCATE TABLE #{table_name}", name)
        end
      end
    end

    # Adds new functionality to ActiveRecord Mysql2Adapter.
    class Mysql2Adapter < AbstractMysqlAdapter
      def truncate(table_name, force, name)
        if force
          disable_referential_integrity do
            execute("TRUNCATE TABLE #{table_name}", name)
          end
        else
          execute("TRUNCATE TABLE #{table_name}", name)
        end
      end
    end
  end
end

#ActiveRecord::Base.send :include, ActiveRecordTruncate::Base


require "active_record_truncate/railtie"
