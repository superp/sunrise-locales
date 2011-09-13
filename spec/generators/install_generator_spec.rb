require 'spec_helper'

describe Sunrise::Locales::InstallGenerator do
  include GeneratorSpec::TestCase
  destination File.expand_path("../../tmp", __FILE__)
#  arguments %w(something)

  before(:all) do
    prepare_destination
    run_generator
  end
  
  it "should create codemirror js and css" do
    assert_file "public/javascripts/codemirror.js"
    assert_file "public/javascripts/yaml.js"
    assert_file "public/stylesheets/codemirror.css"
  end
end
