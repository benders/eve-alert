module Backgroundrb
  module Generators
    class BdrbMigrationGenerator < Rails::Generators::NamedBase
      def self.source_root
        @source_root ||= File.expand_path('../templates', __FILE__)
      end

      def initialize(runtime_args, runtime_options = {})
        runtime_args << 'CreateBackgroundrbQueueTable' if runtime_args.empty?
        super
      end

      def manifest
        record do |m|
          m.migration_template 'migration.rb', 'db/migrate',
            :assigns => { :bdrb_table_name => default_bdrb_table_name }
        end
      end

      protected

        def default_bdrb_table_name
          ActiveRecord::Base.pluralize_table_names ? 'bdrb_job_queue'.pluralize : 'bdrb_job_queue'
        end
    end
  end
end
