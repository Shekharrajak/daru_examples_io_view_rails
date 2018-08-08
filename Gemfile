source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# fetch from the github master branch
# gem 'daru-view', path: '/Users/athityakumar/Documents/GitHub/Sciruby/daru-view'
# gem 'daru-io', path: '/Users/athityakumar/Documents/GitHub/Sciruby/daru-io'
# gem 'nyaplot', git: 'https://github.com/SciRuby/nyaplot.git'

gem 'daru-io', :git => 'https://github.com/Sciruby/daru-io.git'
gem 'daru', :git => 'https://github.com/SciRuby/daru.git'
# gem 'rsruby'
# gem 'rsruby', :git => 'https://github.com/athityakumar/rsruby', :branch => 'fix-stack-error-with-rails'
gem 'jsonpath'
gem 'json'
gem 'nokogiri'
gem 'spreadsheet'
# gem 'daru-view', path: '/Users/shekharrajak/Documents/gsoc17/daru-view'
# gem 'daru-io', path: '/Users/shekharrajak/Documents/gsoc17/daru-io'
gem 'daru-view', git: 'https://github.com/SciRuby/daru-view.git'

# issue : https://github.com/Shekharrajak/daru_examples_io_view_rails/issues/3
gem 'daru-data_tables', git: 'https://github.com/Shekharrajak/daru-data_tables.git'

# remove this after https://github.com/Shekharrajak/daru_examples_io_view_rails/issues/8#issuecomment-323335270
gem 'google_visualr', git: 'https://github.com/winston/google_visualr.git'

# gem 'daru', path: '/Users/shekharrajak/Documents/gsoc17/daru'
# gem 'daru-io', path: '/Users/shekharrajak/Documents/gsoc17/daru-io'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.2'
# Use sqlite3 as the database for Active Record
gem 'pg', '~> 0.21'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # gem 'daru-view', path: '/Users/shekharrajak/Documents/gsoc17/daru-view'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Highlight syntax of inline code demos
gem 'rouge'
