source 'https://rubygems.org'

ruby '2.7.1'

# Bundle edge Rails instead: gem "rails", github: "rails/rails"
gem 'rails', '~> 6.0', '>= 6.0.2.2'

# Use sqlite3 as the database for Active Record
# gem 'sqlite3'

# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 6.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 5.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem "therubyracer", platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# The controller-level `respond_to' feature has been extracted to the `responders` gem.
gem 'responders', '~> 3.0'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem "bcrypt-ruby", "~> 3.1.2"

# Use unicorn as the app server
# gem "unicorn"

# Use Capistrano for deployment
# gem "capistrano", group: :development

# Use Haml for templates
gem 'haml'

# API wrapper for TheMovieDB.org
gem 'themoviedb', git: 'git://github.com/capncanuck/themoviedb.git'

# Needed for heroku
gem 'rails_12factor'

# Use puma instead of WEBrick
gem 'puma'

# CVE-2018-3760
gem "sprockets", ">= 2.12.5"

group :development, :test do
  # Use debugger
  # gem 'debugger'

  gem 'cucumber-rails', '~> 2.0'

  # some pre-fabbed step definitions
  gem 'cucumber-rails-training-wheels'

  # to clear Cucumber's test database between runs
  gem 'database_cleaner'

  # lets Cucumber pretend to be a web browser
  gem 'capybara'

  # a useful debugging aid for user stories
  gem 'launchy'
end

group :test do
  gem 'rspec-rails'

  gem 'factory_girl_rails'
end
