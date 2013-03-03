  namespace :db do
    desc "Clear all sessions stored in DB"
    task :clear_sessions => :environment do
    	 ActiveRecord::Base.connection.execute("DELETE FROM sessions")    	
    end
  end