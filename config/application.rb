require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Zarabarbosa
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    require 'tinymce-rails'
    require 'tinymce-rails-langs'

    #config.web_console.whitelisted_ips = '10.0.2.2'
    config.i18n.default_locale = :"pt-BR"
    config.time_zone = 'Brasilia'

    # config.i18n.fallbacks = {
    #   de: :en
    # }

    # set config ssl
    config.action_controller.forgery_protection_origin_check = false

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
