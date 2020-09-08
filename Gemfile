source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'rails', '~> 6.0.3', '>= 6.0.3.1'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'

gem 'slim'

gem 'bootsnap', '>= 1.4.2', require: false

gem 'contentful_model'

gem 'config'

group :development, :test do
  gem 'pry'
  gem 'rspec-rails', '~> 4.0'
  gem 'factory_bot_rails', '~> 6.1'
  gem 'faker', '~> 2.13'

  gem 'rubocop', '~> 0.90', require: false
  gem 'rubocop-performance', '~> 1.7.1', require: false
  gem 'rubocop-rails', '~> 2.7.1', require: false
  gem 'rubocop-rspec', '~> 1.43.2', require: false
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
