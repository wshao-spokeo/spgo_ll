require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SpgoLl
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
    config.action_dispatch.default_headers.merge!({
    #'Access-Control-Allow-Origin' => 'http://172.20.48.178',
    'Access-Control-Allow-Origin' => '*',
    'Access-Control-Request-Method' => '*'
    #'Access-Control-Request-Method' => %w{GET POST OPTIONS}.join(",")
    })
    #config/application.rb
    config.middleware.insert_before 0, "Rack::Cors" do
      allow do
       origins '*' #-> has to be "*" or specific
       resource '*', headers: :any, methods: [:get, :post, :options]
      end
    end

  end
end
