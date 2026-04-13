source 'https://rubygems.org'

ruby '~> 3.4'

gem 'rails', '~> 8.0'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 2.1'
# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '>= 5.0'
# Asset pipeline
gem 'propshaft'
# Use Dart Sass for stylesheets
gem 'dartsass-rails', '~> 0.5'
# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'importmap-rails', '~> 2.0'
# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails', '~> 2.0'
# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails', '~> 1.3'
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder', '~> 2.11'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'haml-rails', '~> 2.1'

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem 'image_processing', '~> 1.2'

gem 'net-smtp', require: false
gem 'net-imap', require: false
gem 'net-pop', require: false

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.16', require: false

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console', '>= 4.2.0'
  # Performance profiling
  gem 'rack-mini-profiler', '~> 3.0'
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara', '>= 3.39'
  gem 'selenium-webdriver', '>= 4.11'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]