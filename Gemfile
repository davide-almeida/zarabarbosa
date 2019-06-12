source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
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

#GEMs ADICIONADAS
#Devise
gem 'devise'
# Translations for the devise gem
gem 'devise-i18n'
# https://github.com/svenfuchs/rails-i18n
gem 'rails-i18n'
# https://github.com/bokmann/font-awesome-rails
gem "font-awesome-rails"
#gem 'font-awesome-rails', '>= 4.6.3.1'
# https://github.com/dreamingechoes/bootstrap_sb_admin_base_v2
gem 'bootstrap_sb_admin_base_v2'
# https://github.com/jquery-ui-rails/jquery-ui-rails
gem 'jquery-ui-rails'
#Utilizado no "adicionar ou remover telefone"
gem 'nested_form_fields'
# Paginação - https://github.com/kaminari/kaminari
gem 'kaminari'
# Translations for the kaminari gem
gem  'kaminari-i18n'
# https://github.com/thoughtbot/paperclip
gem "paperclip", "~> 6.0.0"
# https://github.com/ddollar/foreman
#gem 'foreman'
#toolbar textarea - GIT(GEM): https://github.com/spohlenz/tinymce-rails - Exemplos: https://www.tiny.cloud/docs/demo/basic-example/
gem 'tinymce-rails'
# https://github.com/spohlenz/tinymce-rails-langs - translate tools
gem 'tinymce-rails-langs'
# https://github.com/comfy/active_link_to
gem 'active_link_to'
# https://github.com/kyamaguchi/shufflejs-rails
# gem 'shufflejs-rails'
# https://github.com/norman/friendly_id
gem 'friendly_id', '~> 5.2.4'

source 'http://insecure.rails-assets.org' do
  # https://rails-assets.org/#/components/bootstrap?version=3.3.7
  gem 'rails-assets-bootstrap', '3.3.7'

  #bootstrap notify
  gem 'rails-assets-bootstrap.growl'

  #bootboxJS - https://rails-assets.org/#/components/bootbox
  gem 'rails-assets-bootbox'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  # https://github.com/voormedia/rails-erd
  #gem 'rails-erd'
end

#armazenar senhas pro deploy
#gem 'figaro'

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Better error page for Rack apps
   gem "better_errors"
   gem "binding_of_caller"
  #rails erd
   gem 'rails-erd'
  # https://github.com/sj26/mailcatcher
  # rodar o mailcatcher com o comando: mailcatcher --http-ip 0.0.0.0 -f -v
  # gem 'mailcatcher'
  #capistrano para fazer deploy
  gem "capistrano", "~> 3.10", require: false
  gem "capistrano-rails", "~> 1.3", require: false
  gem 'capistrano3-puma', require: false
  gem 'capistrano-rvm', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
