require 'rails'
require 'sunrise-locales'

module Sunrise
  module Locales
    class Engine < ::Rails::Engine
      config.before_initialize do
        Sunrise::Plugin.register :locales do |plugin|
          plugin.model = 'sunrise/yml_locale'
          plugin.menu = 'select'
          plugin.version = Sunrise::Locales::VERSION.dup
          plugin.klass = Sunrise::YmlLocale
        end
        
        Sunrise::Plugins.activate(:locales)
      end
    end
  end
end
