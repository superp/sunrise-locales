# encoding: utf-8
require "yaml"

module Sunrise
  class YmlLocale
    attr_accessor :locale

    def initialize(locale)
      @locale = locale
    end
    
    def file_path
      Rails.root.join("config/locales/#{@locale}.yml")
    end
    
    def get_data
      text = ''
      
      f = File.open(file_path, 'r')
      f.each_line { |line| text += line }
      f.close
      
      text
    end
    
    def set_data(text)
      if valid?(text)
        File.open(file_path, 'w') {|f| f.write(text) }
      else
        false
      end
    end
    
    def valid?(text)
      begin
        YAML.load(text)
        true
      rescue Exception => e
        false
      end
    end
  end
end
