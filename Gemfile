source 'https://rubygems.org'

gem 'rails', '3.2.11'
#https://github.com/gregbell/active_admin
gem 'activeadmin' #rails generate active_admin:install
gem "meta_search",    '>= 1.1.0.pre'
# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'



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
end
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
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
