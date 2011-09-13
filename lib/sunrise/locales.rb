# encoding: utf-8
module Sunrise  
  module Locales
    # Default way to setup Sunrise.
    def self.setup
      yield self
    end
  end
end

require 'sunrise/locales/yml_locale'
require 'sunrise/locales/version'
require 'sunrise/locales/engine'
