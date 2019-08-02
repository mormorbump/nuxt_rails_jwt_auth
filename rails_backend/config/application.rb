require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
# require "action_cable/engine"
# require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsBackend
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    # rack-corsの設定。これを設定しないとJavaScriptは他のドメイン上のエンドポイントを紹介できない。
    # https://qiita.com/arakaji/items/f7d32e1c94d67b3e2606
    # https://medium.com/@nandhae/2019-how-i-set-up-authentication-with-jwt-in-just-a-few-lines-of-code-with-rails-5-api-devise-9db7d3cee2c0
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', 
          :headers => :any, 
          :expose  => ['access-token', 'expiry', 'token-type', 'Authorization'],
          :methods => [:get, :patch, :put, :delete, :post, :options, :show, :head]
      end
    end
  end
end
