require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module HanaguriSilver
  class Application < Rails::Application
    config.load_defaults 5.1
    config.i18n.default_locale = :ja
    config.generators.template_engine = :slim
    config.generators do |g|
      g.test_framework :rspec,
        fixtures:      false,
        view_specs:    false,
        helper_specs:  false,
        routing_specs: false
    end
  end
end
