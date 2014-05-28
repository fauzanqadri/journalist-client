require File.join(File.dirname(__FILE__), 'app')
namespace :app do

  desc "Build application depedencies"
  task :build => [:compile_js, :compile_css] do
  end

  desc "Compile javascript assets"
  task :compile_js do
    output_path = File.join($project_root, 'production', 'assets', 'javascripts')
    output_file = Pathname.new(output_path).join('application.min.js')
    compiling = $assets['application.js']
    compiling.write_to(output_file)
  end

  desc "Compile css assets"
  task :compile_css do
    output_path = File.join($project_root, 'production', 'assets', 'stylesheets')
    output_file = Pathname.new(output_path).join('application.min.css')
    compiling = $assets['application.css']
    compiling.write_to(output_file)
  end
end

