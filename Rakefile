require 'rubygems'
require 'sprockets'
require 'uglifier'
require 'coffee_script'
require 'sass'
require 'ejs'

namespace :assets do
  desc "Compile Assets"
  task :compile => [:compile_js, :compile_css] do
  end

  desc 'compile javascript assets'
  task :compile_js do
    project_root = File.expand_path(File.dirname(__FILE__))
    output_path = File.join(project_root, 'assets', 'javascripts')
    output_file = Pathname.new(output_path).join('application.min.js')
    assets = Sprockets::Environment.new(project_root)
    assets.js_compressor = :uglify
    assets.append_path(File.join(project_root, 'development'))
    assets.append_path(File.join(project_root, 'development', 'javascripts'))
    assets.append_path(File.join(project_root, 'bower_components'))
    the_assets = assets['application.js']
    the_assets.write_to(output_file)
  end

  desc 'compile css assets'
  task :compile_css do
    project_root = File.expand_path(File.dirname(__FILE__))
    output_path = File.join(project_root, 'assets', 'stylesheets')
    output_file = Pathname.new(output_path).join('application.min.css')
    assets = Sprockets::Environment.new(project_root)
    assets.context_class.class_eval do
      def asset_path path, options = {}
        "/assets/#{path}"
      end
    end
    assets.css_compressor = :scss
    assets.append_path(File.join(project_root, 'development'))
    assets.append_path(File.join(project_root, 'development', 'stylesheets'))
    assets.append_path(File.join(project_root, 'bower_components'))
    the_assets = assets['application.css']
    the_assets.write_to(output_file)

  end
end
