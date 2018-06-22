source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'bootstrap-kaminari-views'
gem 'bootstrap-sass', '~> 3.3.7'
gem 'carrierwave'
gem 'ckeditor'
gem 'cocoon'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'figaro'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'kaminari'
gem 'mini_magick'
gem 'mysql2', '~> 0.3.18'
gem 'non-stupid-digest-assets', '~> 1.0.4'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.6'
gem 'rails_admin', '~> 1.2'
gem 'ransack'
gem 'ratyrate'
gem 'sass-rails', '>= 3.2'
gem 'simple_form'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'fog'

group :development, :test do
  gem 'byebug', platforms: %i(mri mingw x64_mingw)
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'pry'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
 gem 'rails_12factor'
end

group :assets do
  gem 'turbo-sprockets-rails3'
 end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i(mingw mswin x64_mingw jruby)
