#require "C:/RailsInstaller/Ruby1.9.3/lib/ruby/gems/1.9.1/gems/faster_require-0.9.3/lib/faster_require.rb"
#require "./lib/faster_require-0.9.3/lib/faster_require"
#require 'faster_require'

require 'active_record'
require 'debugger'
#require 'database_cleaner'

connection_info = YAML.load_file("config/database.yml")["test"]
ActiveRecord::Base.establish_connection(connection_info)

RSpec.configure do |config|
  
  # #database_cleaner:
  # config.before(:suite) do
  #   DatabaseCleaner.strategy = :transaction
  #   DatabaseCleaner.clean_with(:truncation)
  # end
  # config.before(:each) do
  #  DatabaseCleaner.start
  # end
  # config.after(:each) do
  #  DatabaseCleaner.clean
  # end

  config.around do |example|
    ActiveRecord::Base.transaction do
      example.run
      raise ActiveRecord::Rollback
    end
  end


end

