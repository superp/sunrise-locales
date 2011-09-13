require 'rails'
require 'sunrise-locales'

module Sunrise
  module Locales
    class Engine < ::Rails::Engine
      config.before_initialize do
        Sunrise::Plugin.register :yml_locales do |plugin|
          plugin.model = 'sunrise/yml_locale'
          plugin.menu = 'select'
          plugin.version = Sunrise::Locales::VERSION.dup
        end
        
        Sunrise::Plugins.activate(:locales)
      end
    end
  end
end
