source 'http://rubygems.org'
gem 'rails', '3.2.11'
# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

#https://github.com/gregbell/active_admin
gem 'activeadmin' #rails generate active_admin:install

gem 'meta_search',    '>= 1.1.0.pre'
gem 'heroku'

#gem 'faster_require' # installation:
#https://github.com/rdp/faster_require
# gem install faster_require
# gem which faster_require
# cd *rails app*
# cd lib
# gem unpack faster_require
# in environment.rb:
# require File.dirname(__FILE__) + "/../lib/faster_require-0.9.3/lib/faster_require"
# make sure you have the right version in upper sentence
# _______________________________
# How to use generally/globally:
# gem which rubygems
# gem which faster_require
# rubygems.rb at the top:
# require 'd:/Ruby192/lib/ruby/gems/1.9.1/gems/faster_require-0.6.0/lib/faster_require.rb'



group :test do
  gem 'sqlite3'
  gem 'debugger'
  
  gem 'simplecov'#place thic code at the VERY top of spec_helper.rb: require 'simplecov'; SimpleCov.start
  #gem 'ZenTest'

  gem "factory_girl_rails"
  gem "spork", "> 0.9.0.rc" #spork --bootstrap
  #more slaves: lib/spork/run_strategy/magazine.rb - Slave_Id_Range = 1..10
  gem "guard-spork" #guard init spork
end

group :test, :development do
  gem 'awesome_print'
  gem 'database_cleaner'
  gem 'launchy'  
  gem "rspec-rails",        :git => "git://github.com/rspec/rspec-rails.git"
  gem "rspec",              :git => "git://github.com/rspec/rspec.git"
  gem "rspec-core",         :git => "git://github.com/rspec/rspec-core.git"
  gem "rspec-expectations", :git => "git://github.com/rspec/rspec-expectations.git"
  gem "rspec-mocks",        :git => "git://github.com/rspec/rspec-mocks.git"

  #guard:
    #windows file system notifier
  gem 'wdm', :platforms => [:mswin, :mingw], :require => false
    #colored console
  gem 'win32console'
  gem 'guard-rspec' #DO NOT FORGET TO bundle exec guard init rspec
  gem 'guard-livereload' #bundle exec guard init livereload
end

group :development do
  gem 'debugger'
  gem 'pg'
end
group :production do
  gem 'pg'
  gem 'newrelic_rpm'
end
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'coffee-script-source', '~> 1.4.0' # ADD THIS LINE, 1.5.0 doesn't compile ActiveAdmin JavaScript files

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
  gem 'yui-compressor'
end

gem 'jquery-rails'

#Twitter Bootstrap
#gem "therubyracer" #no need to intall on windows
#gem "less-rails"
gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git' #rails generate bootstrap:install static
#rails generate bootstrap:install less #if not windows


# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'
