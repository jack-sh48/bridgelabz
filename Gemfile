source 'https://rubygems.org'
source 'https://gem.fury.io/engineerai'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Use Active Storage variant
gem 'image_processing', '~> 1.2'
gem 'active_storage_base64'
gem 'aws-sdk-s3'
gem 'pry-nav'
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 4.0.2'
  gem 'shoulda-matchers', '~> 4.0'
  gem 'dotenv-rails'
  gem 'rspec-sonarqube-formatter', '~> 1.5'
end

group :development do
  gem 'letter_opener'
  gem 'pry-nav'
end

group :test do
  gem 'mock_redis', '0.34.0'
  gem 'simplecov'
  gem 'simplecov-rcov'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'bx_block_admin', '0.0.15'
gem 'bx_block_roles_permissions-c50949d0', '0.0.6', require: 'bx_block_roles_permissions'
gem 'account_block', '0.0.34'
gem 'bx_block_sms', '0.0.5'
gem 'bx_block_categories-acd0763f', '0.0.9', require: 'bx_block_categories'
gem 'bx_block_login-3d0582b5', '0.0.10', require: 'bx_block_login'
gem 'bx_block_content_management', '0.0.3', require: 'bx_block_content_management'
gem 'bx_block_language_options', '0.0.5'
gem 'bx_block_settings-5412d427', '0.0.3', require: 'bx_block_settings'
gem 'bx_block_custom_form-63cd533b', '0.0.7', require: 'bx_block_custom_form'
gem 'bx_block_photo_library-6419d914', '0.0.2', require: 'bx_block_photo_library'
gem 'bx_block_upload_media-9de56634', '0.0.2', require: 'bx_block_upload_media'
gem 'bx_block_custom_ads-e8d68990', '0.0.2', require: 'bx_block_custom_ads'
gem 'builder_base', '0.0.53'
gem 'sidekiq_alive'
gem 'sidekiq', '~> 6.1.0'
gem "yabeda-prometheus"    # Base
gem "yabeda-rails"         #API endpoint monitoring
gem "yabeda-http_requests" #External request monitoring
gem "yabeda-puma-plugin"
gem 'yabeda-sidekiq'
gem 'bx_block_cors'
gem 'devise'
gem 'sassc-rails'
gem 'activeadmin'
gem 'active_admin_role'
gem 'activeadmin_json_editor'
gem 'active_admin_datetimepicker'
gem 'rack-cors'
gem 'carrierwave'
gem 'faker'
