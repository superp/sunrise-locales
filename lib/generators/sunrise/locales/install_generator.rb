require 'rails/generators'

module Sunrise
  module Locales
    class InstallGenerator < Rails::Generators::Base      
      source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))

      desc "Generates CodeMirror js and css"
      
      def copy_js
        copy_file('codemirror.js', 'public/javascripts/codemirror.js')
        copy_file('yaml.js', 'public/javascripts/yaml.js')
      end
      
      def copy_css
        copy_file('codemirror.css', 'public/stylesheets/codemirror.css')
      end
    end
  end
end
