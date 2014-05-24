require 'sprockets'
require 'sprockets-less'
require 'uglifier'
require 'coffee-script'
require 'sass'
require 'less'
require 'ejs'
require 'logger'
project_root = File.expand_path(File.dirname(__FILE__))
Sprockets::Less.options[:compress] = true
assets = Sprockets::Environment.new(project_root) do |env|
  env.logger = Logger.new(STDOUT)
end
assets.js_compressor = :uglify
assets.css_compressor = :scss
assets.append_path(File.join(project_root, 'development'))
assets.append_path(File.join(project_root, 'development', 'javascripts'))
assets.append_path(File.join(project_root, 'development', 'stylesheets'))
assets.append_path(File.join(project_root, 'development', 'images'))
assets.append_path(File.join(project_root, 'bower_components'))
assets.context_class.class_eval do
  def asset_path path, options = {}
    "/assets/#{path}"
  end
end

map "/assets" do
  run assets
end

map "/" do
  run lambda {|env| 
    [
      200,
      {
        'Content-type' => 'text/html',
        'Cache-Control' => 'public, max-age=86400'
      },
      File.open('popup.html', File::RDONLY)
    ]
  }
end
