require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FrBackoffice
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
    config.i18n.enforce_available_locales = false
    config.i18n.available_locales = :en

    config.action_dispatch.default_headers = {
        'X-Frame-Options' => '',
        'X-Content-Type-Options' => '',
        'X-XSS-Protection' => '',
        'Pragma' => '',
        'Cache-Control' => '',
        'Expires' => ''
    } # let nginx set these headers

    config.relative_url_root = ENV['RAILS_RELATIVE_URL_ROOT'] || ''

    # disable default <div class="field_with_errors"> wrapping idiocy
    config.action_view.field_error_proc = Proc.new { |html_tag, instance|
      html_tag
    }

    # app title appears in the header bar
    config.app_title = 'Fee Remission'
    config.proposition_title = 'Fee Remission - back office'
    # phase governs text indicators and highlight colours
    # presumed values: alpha, beta, live
    config.phase = 'alpha'
    # product type may also govern highlight colours
    # known values: information, service
    config.product_type = 'service'
    # Feedback URL (URL for feedback link in phase banner)
    # Use 'auto_add_path' for it to add a path link to the new_feedback route
    config.feedback_url = config.relative_url_root #+ '/feedback/new'

    config.autoload_paths += Dir["#{Rails.root}/app/lib/**/"]

    # Enable the asset pipeline
    config.assets.enabled = true
    config.assets.precompile += %w(
      govuk_elements_extensions_ie6.css
      govuk_elements_extensions_ie7.css
      govuk_elements_extensions_ie8.css
    )
  end
end
