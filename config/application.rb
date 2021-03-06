# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Pitaka
  # Application
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.middleware.insert_before 0, Rack::Cors do
      puts 123
      puts Rails.application.credentials[Rails.env.to_sym]
      allow do
        origins Rails.application.credentials[Rails.env.to_sym][:allowed_origins]
        resource '*',
                 headers: ['Content-Type'],
                 credentials: false,
                 max_age: 86_400,
                 methods: %i[get post patch options delete put]
      end
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
